# Caso sintético: RetailFlow

A RetailFlow quer reduzir latência entre aplicações e banco transacional sem migrar todos os workloads para um único provedor.

## Restrições
- Dados, custos e identidades são fictícios.
- Não há conta nem recurso em AWS, Azure, GCP ou OCI.
- O objetivo é entender opções de arquitetura, não escolher fornecedor real.

## Decisões para avaliar
1. Quando a proximidade entre aplicação e banco faz sentido?
2. Que dependências de rede, identidade e observabilidade devem ser avaliadas?
3. Quais workloads devem permanecer independentes por provedor?