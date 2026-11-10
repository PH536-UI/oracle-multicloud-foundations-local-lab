#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Uso: $0 <init|validate|plan|apply> [diretorio] [argumentos Terraform...]" >&2
  exit 64
}

command_name="${1:-}"
shift || true
root="${1:-.}"
if [[ $# -gt 0 ]]; then
  shift
fi

case "$command_name" in
  init|validate|plan|apply) ;;
  *) usage ;;
esac

if [[ ! -d "$root" ]]; then
  echo "Falha: diretório Terraform não encontrado: $root" >&2
  exit 66
fi

python3 - "$root" "$command_name" <<'PY'
from pathlib import Path
from urllib.parse import urlparse
import re
import sys

root = Path(sys.argv[1]).resolve()
command = sys.argv[2]
marker = root / ".local-only-apply"
files = list(root.rglob("*.tf")) + list(root.rglob("*.tfvars"))
text = "\n".join(path.read_text(errors="ignore") for path in files)

if re.search(r"-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----|\bAKIA[0-9A-Z]{16}\b", text):
    raise SystemExit("Falha: possível credencial real identificada.")

values = re.findall(r'(?im)^\s*(?:endpoint|endpoints|host|base_url)\s*=\s*"([^"\n]+)"', text)
if command == "apply":
    if not marker.is_file() or marker.read_text().strip() != "approved=true":
        raise SystemExit("Falha: apply local exige .local-only-apply com approved=true no diretório do cenário.")
    if not values:
        raise SystemExit("Falha: apply local exige endpoint ou host explícito no Terraform.")

for value in values:
    parsed = urlparse(value if "://" in value else f"//{value}")
    host = (parsed.hostname or "").lower()
    if host not in {"localhost", "127.0.0.1", "::1"}:
        raise SystemExit(f"Falha: endpoint não local bloqueado: {value}")

print("Preflight aprovado: sem credencial real conhecida e endpoints locais validados.")
PY

exec terraform -chdir="$root" "$command_name" "$@"
