# Teste de Web Scraping

Este projeto realiza um teste de web scraping que executa as seguintes tarefas:

1. **Acesso ao site:**  
   [Atualização do Rol de Procedimentos - ANS](https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos)

2. **Download dos Anexos I e II (em formato PDF):**  
   O código acessa o site, identifica e baixa os arquivos PDF referentes aos Anexos I e II.

3. **Compactação dos Anexos:**  
   Todos os anexos baixados são compactados em um único arquivo (ZIP, RAR, etc).

---

## Pré-requisitos

- **Docker:**  
  Certifique-se de que o [Docker](https://www.docker.com/get-started) está instalado e rodando, para a execução via Docker.

- **Python 3:**  
  Certifique-se de que o [Python 3](https://www.python.org/downloads/) está instalado, caso prefira executar o script Python diretamente.

- (Opcional) **Ambiente Virtual:**  
  Recomenda-se a criação de um ambiente virtual para isolar as dependências do projeto.

---

## Como Executar

Você pode executar o código utilizando **Docker** ou diretamente com **Python**. A seguir, estão todas as instruções detalhadas, desde a navegação até o diretório do projeto, a construção da imagem, a execução do container e a execução via Python.

---

### **Opção 1: Executar via Docker**

Com essa você pode executar a atividade automaticamente.

#### Passo 1: Navegue até o Diretório do Projeto

Abra o terminal e navegue até a pasta onde se encontra o `Dockerfile` e os demais arquivos do projeto:

```bash
cd caminho/para/o/projeto
```

*Exemplo (Windows PowerShell):*

```powershell
cd C:\Users\seu_usuario\Desktop\1_web_scraping
```

#### Passo 2: Construa a Imagem Docker

No diretório onde o `Dockerfile` está localizado, execute:

```bash
docker build -t webscraper .
```

Esse comando cria uma imagem Docker chamada `webscraper`.

#### Passo 3: Crie um Diretório para a Saída (Opcional)

Crie uma pasta para armazenar o arquivo compactado gerado pela execução do container:

```bash
mkdir output
```

#### Passo 4: Execute o Container

Execute o container e monte o diretório de saída:

```bash
docker run --rm -v "$(pwd)/output:/output" webscraper
```

#### Resultado via Docker

O container fará o seguinte:
- Acessará o site da ANS;
- Baixará os anexos PDF (Anexo I e II);
- Compactará os arquivos baixados em um único arquivo (ZIP, RAR, etc);
- Salvará o arquivo compactado na pasta `output` do seu diretório local.

---

### **Opção 2: Executar via Python**

Caso prefira rodar o script Python diretamente, siga os passos abaixo.

#### Passo 1: Navegue até o Diretório do Projeto

```bash
cd caminho/para/o/projeto
```

#### Passo 2: (Opcional) Crie e Ative um Ambiente Virtual

```bash
python -m venv venv
```

Ative o ambiente:

- **Windows:** `venv\Scripts\activate`
- **macOS/Linux:** `source venv/bin/activate`

#### Passo 3: Instale as Dependências


```bash
pip install requests beautifulsoup4 lxml
```

#### Passo 4: Navegue até o Diretório do Script

```bash
cd 1_web_scraping
```

#### Passo 5: Execute o Script

```bash
python scraper.py
```

---

## Considerações Gerais

- **Saída dos Dados:** O script/contêiner gera um arquivo compactado com os anexos.
- **Logs:** Use o terminal para visualizar erros ou mensagens de depuração.
- **Personalização:** Ajuste o formato de saída, diretórios, etc., conforme necessário.

---

## Autor

Carlos Felipe dos Santos Pereira  
cs134922@gmail.com

