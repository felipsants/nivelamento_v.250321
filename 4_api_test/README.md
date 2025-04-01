
# 🧪 Teste de API - Interface Web com Vue.js e Python

Este projeto implementa uma interface web simples construída com **Vue.js**, que interage com um servidor em **Python (Flask)** para buscar operadoras de saúde com base em texto. Os dados são carregados a partir de um CSV previamente utilizado na atividade 3.2.

---

## 📁 Estrutura do Projeto

```bash
4_api_test/
├── backend/
│   ├── app.py               # Servidor Flask
│   ├── Relatorio_cadop.csv       # CSV com os cadastros das operadoras (do item 3.2)
├── frontend/
│   ├── intuitive-app/ 
│       ├── public/
│       ├── src/
│       │   ├── components/
│       │   │   └── SearchOperadoras.vue   # Componente de busca
│       │   └── App.vue
│       └── package.json         # Configurações do Vue
└── postman/
    └── TesteAPI.postman_collection.json  # Coleção do Postman com testes de busca
```

---

## 🚀 Como Rodar o Projeto

### 🐍 Backend (Python + Flask)

1. Acesse a pasta do backend:

```bash
cd backend
```

2. Instale as dependências:

```bash
pip install flask, flask-cors
```

3. Inicie o servidor:

```bash
python app.py
```

> O servidor estará disponível em `http://localhost:5000`.

### 🌐 Frontend (Vue.js)

1. Acesse a pasta do frontend:

```bash
cd frontend/intuitive-app
```

2. Instale as dependências:

```bash
npm install
```

3. Inicie o servidor Vue:

```bash
npm run serve
```

> A aplicação estará disponível em `http://localhost:8080`.

---

## 📡 Rota da API

- **Método:** `GET`
- **Endpoint:** `/search?q=<palavra>`
- **Exemplo:** `http://localhost:5000/search?q=nome_a_buscar`
- **Retorno:** Uma lista de registros de operadoras que contenham o texto buscado no nome fantasia, CNPJ ou razão social.

---

## 🔍 Coleção Postman

A coleção `TesteAPI.postman_collection.json` pode ser importada no [Postman](https://www.postman.com/) para testar facilmente a API. Ela contém:

- Requisições para testes de busca com diferentes palavras-chave
- Verificação de retornos em diferentes cenários

---

## 📌 Observações

- O CSV utilizado deve estar no formato esperado pela aplicação, com colunas como `CNPJ`, `RAZAO_SOCIAL`, `NOME_FANTASIA`, etc.
- A busca textual feita pelo backend é case-insensitive e retorna todos os registros que contenham a substring buscada em qualquer dos campos relevantes.

---

## 👤 Autor

Carlos Felipe dos Santos Pereira  
cs134922@gmail.com
