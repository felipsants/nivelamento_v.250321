from flask import Flask, request, jsonify
from flask_cors import CORS
import csv

app = Flask(__name__)
CORS(app)

OPERADORAS = []
with open('C:/Users/rebek/Desktop/felipé/nivelamento_v.250321/4_api_test/backend/Relatorio_cadop.csv', newline='', encoding='utf-8') as csvfile:
    reader = csv.DictReader(csvfile, delimiter=';')
    for row in reader:
        OPERADORAS.append(row)

def busca_operadoras(termo):
    termo = termo.lower()
    resultados = []
    for op in OPERADORAS:
        if termo in op.get('Razao_Social', '').lower() or termo in op.get('Nome_Fantasia', '').lower():
            resultados.append(op)
    return resultados

@app.route('/search', methods=['GET'])
def search():
    termo = request.args.get('q', '')
    if termo:
        registros = busca_operadoras(termo)
        return jsonify(registros)
    else:
        return jsonify([])

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
