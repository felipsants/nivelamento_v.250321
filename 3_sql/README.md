# Teste de Banco de Dados

Este projeto contém scripts SQL compatíveis com **PostgreSQL (> 10.0)** que realizam tarefas de ingestão e análise de dados públicos fornecidos pela ANS.

---

## Descrição da Atividade

O projeto abrange as seguintes etapas:

### 🔹 Preparação de Dados

1. **Download dos arquivos dos últimos 2 anos** do repositório público:
   - [Demonstrativos Contábeis](https://dadosabertos.ans.gov.br/FTP/PDA/demonstracoes_contabeis/)

2. **Download dos dados cadastrais das Operadoras Ativas da ANS:**
   - [Operadoras Ativas - CSV](https://dadosabertos.ans.gov.br/FTP/PDA/operadoras_de_plano_de_saude_ativas/)

### 🔹 Scripts SQL

3. **Criação de tabelas:**  
   Queries para estruturar tabelas compatíveis com os dados dos arquivos CSV.

4. **Importação de dados:**  
   Queries para importar corretamente os dados dos arquivos CSV, respeitando o encoding (UTF-8) e delimitadores corretos.

---

## Pré-requisitos

- PostgreSQL **versão 10 ou superior** instalado e configurado.
- Um servidor funcional criado (ex: via Docker, localmente ou em nuvem).
- Uma ferramenta cliente como **pgAdmin**, **DBeaver** ou terminal `psql` para execução dos scripts.

---

## Estrutura dos Scripts

- `estrutura_postgres.sql`: Criação das tabelas `operadores_ativos`, `demonstracoes_contabeis`, `staging_dados` e `staging_4t2023`.
- `staging_dados.sql`: Faz a extração dos dados do CSV e coloca neste tabela, onde todas as colunas são do tipo TEXT (menos a coluna DATA), para que possamos tratar os valores decimais.
- `staging_4t2023`: Faz a extração dos dados do CSV 4T2023 e coloca neste tabela, onde todas as colunas são do tipo TEXT, para que possamos tratar os valores decimais e a data que veio num formato não convencional.
- `transformar_dados.sql`: Transformações e inserções na base final, incluindo substituição de vírgulas por pontos, datas e tipo numérico. Além de, validar as FK e "puxar" apenas os operadores ativos.
- `despesas_ultimo_ano.sql`: Query analítica para identificar as 10 operadoras com maiores despesas na categoria específica no último ano.
- `despesas_ultimo_trimestre.sql`: Query analítica equivalente para o último trimestre.

---

## Como Executar

### 1. Crie um Banco de Dados no PostgreSQL via Docker

- Eu fiz essa atividade utilizando o Docker, portanto eu criei a imagem do meu servidor de uma forma especifica, para que os arquivos estivessem disponíveis para que o PostgreSQL pudesse acessar. Código utilizado:

    ```bash
     docker run --name intuitive -e POSTGRES_PASSWORD=1234 -e POSTGRES_DB=intuitive -p 5432:5432 -v C:/Users/rebek/Desktop/felipé/nivelamento_v.250321/3_sql/relatorios_semestre:/dados_csv -d postgres
     ```

- Onde temos `C:/Users/rebek/Desktop/felipé/nivelamento_v.250321/3_sql/relatorios_semestre:/dados_csv`, você deve colocar o caminho onde estão todos os `.csv`, mantendo essa parte final do caminho `:/dados_csv`. Portanto o caminho que ficará no seu comando será algo do tipo: 

    ```bash
     docker run --name intuitive -e POSTGRES_PASSWORD=1234 -p 5432:5432 -v C:/caminho/dos/seus/arquivos:/dados_csv -d postgres
     ```

### 2. Execute os scripts em ordem via Dockker
- Estando na pasta `NIVELAMENTO_V.250321`, execute os seguintes comandos:

1. Estrutura inicial:
   ```bash
   docker exec -i intuitive psql -U postgres -d intuitive -f - < 3_sql/estrutura_postgres.sql
   ```

2. Preparação dos dados:
   ```bash
   docker exec -i intuitive psql -U postgres -d intuitive -f - < 3_sql/staging_dados.sql
   ```

3. Transformação e inserção:
   ```bash
   docker exec -i intuitive psql -U postgres -d intuitive -f - < 3_sql/transformar_dados.sql
   ```

4. Análises:
   - Último trimestre:
     ```bash
     docker exec -i intuitive psql -U postgres -d intuitive -f - < 3_sql/despesas_ultimo_trimestre.sql
     ```
   - Último ano:
     ```bash
     docker exec -i intuitive psql -U postgres -d intuitive -f - < 3_sql/despesas_ultimo_ano.sql
     ```

---

### 3. Execute os scripts em ordem Localmente
- Para a importação dos dados, o comando `COPY` usado nos scripts exige que o PostgreSQL tenha acesso direto aos arquivos CSV. 
- Se você estiver rodando o PostgreSQL localmente, é necessário adaptar os caminhos nos comandos `COPY` (ou utilizar `\COPY`). 
- Essas instruções estão comentadas dentro do arquivo `staging_dados.sql`.

- Estando na pasta `NIVELAMENTO_V.250321`, execute os seguintes comandos no terminal com o `psql` instalado localmente:

1. Estrutura inicial:
   ```bash
   psql -U postgres -d intuitive -f 3_sql/estrutura_postgres.sql
   ```

2. Preparação dos dados:
   ```bash
   psql -U postgres -d intuitive -f 3_sql/staging_dados.sql
   ```

3. Transformação e inserção:
   ```bash
   psql -U postgres -d intuitive -f 3_sql/transformar_dados.sql
   ```

4. Análises:
   - Último trimestre:
     ```bash
     psql -U postgres -d intuitive -f 3_sql/despesas_ultimo_trimestre.sql
     ```
   - Último ano:
     ```bash
     psql -U postgres -d intuitive -f 3_sql/despesas_ultimo_ano.sql
     ```

---

## Consultas Analíticas

As queries finais respondem às seguintes perguntas:

- ✅ **Quais as 10 operadoras com maiores despesas em "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR" no último trimestre?**
- ✅ **Quais as 10 operadoras com maiores despesas nessa categoria no último ano?**

Essas consultas relacionam os demonstrativos contábeis com a razão social da operadora.

---

## Autor

Carlos Felipe dos Santos Pereira  
cs134922@gmail.com