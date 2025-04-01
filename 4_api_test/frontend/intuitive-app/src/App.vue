<template>
  <div class="container">
    <!-- Busca -->
    <div class="left-card">
      <h2>Busca de Operadoras</h2>
      <input 
        v-model="searchTerm" 
        placeholder="Digite o nome da operadora" 
        @keyup.enter="realizarBusca"
      />
      <button @click="realizarBusca">Buscar</button>
    </div>
    
    <!-- Resultados -->
    <div class="right-card">
      <h2>Resultados</h2>
      <div class="results">
        <div v-if="loading">Carregando...</div>
        <div v-else-if="!loading && searchTerm && resultados.length === 0">
          Nenhuma operadora encontrada.
        </div>
        <ul v-else>
          <li v-for="(operadora, index) in resultados" :key="index">
            <strong>{{ operadora.Razao_Social }}</strong> - {{ operadora.Nome_Fantasia }}
          </li>
        </ul>
      </div>
    </div>
  </div>

  <footer class="footer">
    <strong>Razão Social</strong> - Nome Fantasia
  </footer>
</template>

<script>
export default {
  data() {
    return {
      searchTerm: '',
      resultados: [],
      loading: false,
    }
  },
  methods: {
    async realizarBusca() {
      if (!this.searchTerm.trim()) return;
      this.loading = true;
      try {
        const response = await fetch(`http://localhost:5000/search?q=${encodeURIComponent(this.searchTerm)}`);
        this.resultados = await response.json();
      } catch (error) {
        console.error('Erro na busca:', error);
      } finally {
        this.loading = false;
      }
    },
  },
};
</script>

<style scoped>
.container {
  display: flex;
  justify-content: center;
  align-items: flex-start;
  gap: 20px;
  padding: 20px;
  height: calc(100vh - 60px);
  box-sizing: border-box;
}

.left-card {
  width: 300px;
  background-color: #f7f7f7;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  text-align: center;
}

.right-card {
  flex: 1;
  max-width: 600px;
  background-color: #f7f7f7;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  display: flex;
  flex-direction: column;
}

.results {
  margin-top: 10px;
  overflow-y: auto;
  max-height: 400px;
}

input {
  width: 100%;
  padding: 8px;
  margin-bottom: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

button {
  padding: 8px 16px;
  border: none;
  background-color: #3498db;
  color: #fff;
  border-radius: 4px;
  cursor: pointer;
}

button:hover {
  background-color: #2980b9;
}

ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

li {
  padding: 10px;
  border-bottom: 1px solid #ddd;
}

li:last-child {
  border-bottom: none;
}

.footer {
  text-align: center;
  padding: 10px;
  background-color: #f0f0f0;
  font-style: italic;
  font-size: 0.9em;
}
</style>
