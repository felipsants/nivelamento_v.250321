# Teste de Transformação de Dados

Este projeto realiza a extração e transformação de dados a partir de um arquivo PDF, conforme especificado no teste técnico.

---

## Objetivo

Executar um script Python que:

1. **Extrai dados da tabela** "Rol de Procedimentos e Eventos em Saúde" contida no **Anexo I (PDF)** do Teste 1.
2. **Processa todas as páginas** do PDF e converte os dados em uma tabela estruturada.
3. **Salva os dados em formato CSV**.
4. **Compacta o arquivo CSV** em um arquivo ZIP com o nome `Teste_{seu_nome}.zip`.
5. **Substitui as abreviações OD e AMB** pelas descrições completas, conforme legenda do rodapé do PDF.

---

## Bibliotecas Utilizadas

- `pdfplumber` - para ler e extrair tabelas do PDF.
- `pandas` – para manipulação e exportação dos dados em formato CSV.
- `zipfile` (embutida no Python)
- `os` (embutida no Python)

---

## Como Executar

### 1. (Opcional) Criar Ambiente Virtual

```bash
python -m venv venv
```

Ative o ambiente virtual:

- **Windows:**
  ```bash
  venv\Scripts\activate
  ```
- **macOS/Linux:**
  ```bash
  source venv/bin/activate
  ```

### 2. Instalar Dependências

Instale os pacotes necessários:

```bash
pip install pdfplumber pandas
```

Certifique-se de que o **PDF do Anexo I** esteja disponível no caminho especificado dentro do script, no campo `zip_path` coloque o path do zip gerado na atividade de web scraping.

### 3. Executar o Script

Executar o arquivo chamado: `transformar.py`

```bash
python transformar.py
```

---

## Resultado

- Um arquivo `.csv` com os dados da tabela extraída.
- Um arquivo `.zip` com o nome `Teste_{seu_nome}.zip` contendo o CSV.
- As colunas "OD" e "AMB" substituídas por suas descrições completas.

---

## Autor

Carlos Felipe dos Santos Pereira  
cs134922@gmail.com
