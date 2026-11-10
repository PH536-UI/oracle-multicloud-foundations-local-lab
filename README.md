# Oracle Multicloud Foundations Local Lab

Laboratório local-first para estudar a trilha Oracle Multicloud Foundations Associate (1Z0-1144-26).

## Objetivo
Transformar os conceitos do curso em cenários reproduzíveis com Docker, Terraform e dados sintéticos, sem conta cloud, cobrança, credenciais reais ou recursos de produção.

## Estado inicial
- Estrutura dos seis módulos criada.
- Nenhum serviço de nuvem real é acessado.
- A execução futura será limitada a `terraform init`, `terraform validate` e `terraform plan`.
- `terraform apply` e `terraform destroy` são proibidos neste repositório.

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