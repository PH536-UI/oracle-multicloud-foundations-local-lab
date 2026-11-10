# Oracle Multicloud Foundations Local Lab

Laboratório local-first para estudar a trilha Oracle Multicloud Foundations Associate (1Z0-1144-26).

## Objetivo
Transformar os conceitos do curso em cenários reproduzíveis com Docker, Terraform e dados sintéticos, sem conta cloud, cobrança, credenciais reais ou recursos de produção.

## Estado inicial
- Estrutura dos seis módulos criada.
- Nenhum serviço de nuvem real é acessado.
- A execução futura usa `terraform init`, `terraform validate`, `terraform plan` e, quando o cenário estiver completamente local, `terraform apply` controlado.
- `terraform destroy` permanece proibido.

## Apply local controlado
O apply é permitido somente por `bash scripts/terraform-local.sh apply <diretorio-do-cenario>`. O script exige:
- arquivo `.local-only-apply` com `approved=true` no diretório do cenário;
- endpoint ou host explícito somente em `localhost`, `127.0.0.1` ou `::1`;
- ausência de padrões conhecidos de credenciais reais.

Ainda não existe cenário Terraform executável neste repositório. A regra será usada a partir do primeiro cenário com emulador local.

## Módulos
1. Introduction to Multicloud
2. Multicloud Architecture Foundations
3. Onboarding Foundations for Oracle AI Database@CSP
4. Database Services and Lifecycle Management
5. Data Resilience and High Availability
6. Migration and Security

Leia `docs/COURSE-MAP.md` para o mapa de cenários e `docs/EMULATION-BOUNDARIES.md` para os limites técnicos.

## Segurança
Nunca adicione tokens, chaves, certificados, arquivos `.tfstate`, logs sensíveis ou evidências brutas. Use somente endpoints locais e dados fictícios.