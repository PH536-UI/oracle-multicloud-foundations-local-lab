# Arquitetura inicial

O laboratório terá três camadas:

1. `scenarios/`: requisitos, diagramas, dados sintéticos e critérios de aceite por módulo.
2. `infra/`: definições locais de Docker e Terraform, separadas por cenário.
3. `scripts/`: verificações de segurança e geração de evidências sanitizadas.

Fluxo seguro: preflight, init, validate, plan e coleta sanitizada. Não há etapa de aplicação de infraestrutura.