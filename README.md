# Oficina Mecânica
## 📘 Descrição Geral
Esse projeto foi desenvolvido aplicando o modelo relacional para o **cenário de uma oficina mecânica.**
O objetivo é representar todas as entidades, relacionamentos e regras de negócio de um sistema que gerencia clientes, veículos, ordens de serviço, peças, serviços e pagamentos.

O projeto inclui:
- **Modelagem lógica completa (DDL)**
- **Dados de teste (DML)**
- **Triggers para validação de regras de negócio**
- **Consultas SQL simples e complexas, cobrindo todos os tópicos necessários:**
   `SELECT`, ` WHERE`, expressões derivadas, `ORDER BY`, `GROUP BY`, `HAVING`, `JOIN`.

## Modelo Lógico - Estrutura do Banco
#### Entidades Principais

| Tabela             |     | Descrição                                                                            |
| ------------------ | --- | ------------------------------------------------------------------------------------ |
| **clientes**       |     | Armazena informações básicas dos clientes da oficina.                                |
| **veículos**       |     | Relaciona cada veículo a um cliente (1:N).                                           |
| **funcionarios**   |     | Armazena mecânicos e atendentes (função e status).                                   |
| **servicos**       |     | Catálogo de serviços oferecidos (ex: alinhamento, troca de óleo).                    |
| **pecas**          |     | Catálogo de peças vendidas/utilizadas.                                               |
| **ordens_servico** |     | Cabeçalho da ordem de serviço: cliente, veículo e funcionário responsável.           |
| **itens_servico**  |     | Serviços aplicados em cada ordem de serviço (N:N entre Ordem de Serviço ↔ serviços). |
| **itens_pecas**    |     | Peças utilizadas em cada ordem de serviço (N:N entre ordem de serviço ↔ peças).      |
| **pagamentos**     |     | Registra pagamentos de cada ordem de serviço (permite parcelamento).                 |

## ⚙️ Regras de Negócio
- Uma **ordem de serviço pertence a **um cliente** e a **um veículo.**
- Cada ordem de serviço possui um **funcionário responsável.**
- O **valor total da ordem de serviço** é a soma de todos os serviços e peças utilizados, considerando possíveis descontos.
- O status da ordem de serviço pode ser:
  `Aberta`, `Em andamento`, `Concluída`, `Cancelada`.
- Pagamentos podem ocorrer em múltiplicas parcelas (`1:N`).
- Nenhum peça pode ter **preço de venda menor que o custo** (validado via trigger).

#### 🧩 Estrutura do banco (DDL)
> O banco utilizada codificação utf8mb4_general_ci para compatibilidade ampla com MySQL 8+.

#### 🔄 Triggers de Negócio
##### 🔹 Validação de preço de venda das peças
Garante que nenhuma peça tenha preço de venda menor que o custo.

#### 💾 Dados de Teste (DML)
Foram inseridos alguns registros nas tabelas, com dados simulados e coerentes (nomes de clientes, veículos, serviços, etc.) para permitir os testes nas consultas e validações de relacionamento.

#### 🔍 Consultas SQL (Simples e Complexas)
1. **[Recuperações básicas](./consultas/recuperacao_simples.sql)**
2. **[Filtros com WHERE](./consultas/status_ordens_servico.sql)**
3. **[Expressões derivadas](./consultas/atributos_derivados.sql)**
4. **[ORDER BY - Tpp clientes por gasto (considerando todas as ordens de serviço concluídas)](./consultas/clientes_fieis.sql)**
