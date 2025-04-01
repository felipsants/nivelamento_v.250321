<template>
  <div>
    <h1>Busca de Operadoras</h1>
    <input v-model="searchTerm" placeholder="Digite o nome da operadora" @keyup.enter="realizarBusca" />
    <button @click="realizarBusca">Buscar</button>

    <div v-if="loading">Carregando...</div>
    <div v-if="!loading && resultados.length === 0 && searchTerm">
      Nenhuma operadora encontrada.
    </div>

    <ul v-if="resultados.length">
      <li v-for="(operadora, index) in resultados" :key="index">
        <strong>{{ operadora.Razao_Social }}</strong> - {{ operadora.Nome_Fantasia }}
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {
      searchTerm: '',
      resultados: [],
      loading: false
    };
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
    }
  }
};
</script>

<style scoped>
input {
  width: 300px;
  padding: 8px;
  margin-right: 8px;
}
</style>
