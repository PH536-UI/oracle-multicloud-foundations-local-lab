# Limites da emulação

## Pode ser simulado
- Topologia multicloud e interconexão lógica.
- Papéis, permissões e workflow de onboarding fictícios.
- Conectividade, inventário, monitoramento, backup, restore, migração e controles de segurança com dados sintéticos.

## Deve ser documentado, não reproduzido como serviço real
- Oracle AI Database@AWS, @Azure e @Google Cloud.
- Autonomous AI Database, Exadata Database Service, MAA e ZDM.
- Ofertas privadas/públicas, billing e consumo.

## Regras imutáveis
- Sem contas, credenciais, endpoints públicos ou custos reais.
- `terraform apply` é permitido apenas por `scripts/terraform-local.sh` e somente após validar endpoints locais explícitos.
- Cada cenário que usar apply deve ter `.local-only-apply` contendo exatamente `approved=true`.
- `terraform destroy` é proibido.
- Evidências publicáveis devem ser sanitizadas.