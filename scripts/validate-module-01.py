#!/usr/bin/env python3
from pathlib import Path
import json
import sys

root = Path(__file__).resolve().parents[1]
module = root / "scenarios/01-introduction"
required = [
    module / "README.md",
    module / "case-study.md",
    module / "diagram.md",
    module / "WORKSHEET.md",
    module / "data/provider-catalog.json",
]
missing = [str(path.relative_to(root)) for path in required if not path.is_file()]
if missing:
    print("FALHOU: arquivos ausentes: " + ", ".join(missing))
    sys.exit(1)

catalog = json.loads((module / "data/provider-catalog.json").read_text())
providers = {item["name"] for item in catalog.get("providers", [])}
expected = {"AWS", "Azure", "Google Cloud", "Oracle Cloud Infrastructure"}
if providers != expected:
    print("FALHOU: catálogo deve conter exatamente AWS, Azure, Google Cloud e Oracle Cloud Infrastructure.")
    sys.exit(1)
if catalog.get("data_classification") != "synthetic-only":
    print("FALHOU: o cenário deve usar apenas dados sintéticos.")
    sys.exit(1)

print("OK: módulo 01 preparado com quatro provedores e dados sintéticos.")