import pdfplumber
import pandas as pd
import zipfile
import os

zip_path = "C:/Users/cs134/OneDrive/Área de Trabalho/processo_intuitive/web_scraping/anexos.zip"
pdf_nome = "Anexo_I_Rol_2021RN_465.2021_RN627L.2024.pdf"
script_dir = os.path.dirname(os.path.abspath(__file__))
pdf_path = os.path.join(script_dir, pdf_nome)

def substituir_abreviacoes(df):
    abreviacoes = {
        "OD": "Seg. Odontológica",
        "AMB": "Seg. Ambulatorial"
    }

    for col in df.columns:
        df[col] = df[col].replace(abreviacoes)
    return df

def extrair_dados_pdf(pdf_path):
    with pdfplumber.open(pdf_path) as pdf:
        dados = []
        cabecalho_extraido = False

        for pagina in pdf.pages:
            tabela = pagina.extract_table()
            if tabela:
                if not cabecalho_extraido:
                    dados.append(tabela[0])
                    cabecalho_extraido = True
                dados.extend(tabela[1:])

        return dados
    
def salvar_csv(dados, filename):
    df = pd.DataFrame(dados[1:], columns=dados[0])
    df = substituir_abreviacoes(df)
    df.columns = df.columns.str.replace('\n', ' ', regex=False) # Retirando as quebras de linhas
    print(df.columns)
    df.to_csv(filename, index=False)
    print(f"Dados salvos com sucesso em {filename}")

def zipar(csv, zipname, script_dir):
    zip_path = os.path.join(script_dir, zipname)

    with zipfile.ZipFile(zip_path, 'w') as zipf:
        zipf.write(csv, os.path.basename(csv))
    print(f"Arquivo zipado com sucesso em {zipname}")

def descompactar_zip(zip_path, script_dir):
    with zipfile.ZipFile(zip_path, 'r') as zipf:
        if pdf_nome in zipf.namelist():
            zipf.extract(pdf_nome, script_dir)
            print(f"Arquivo {pdf_nome} extraído com sucesso")


descompactar_zip(zip_path, script_dir)
dados_pdf = extrair_dados_pdf(pdf_path) 

nome_csv = "Rol_de_Procedimentos.csv"
salvar_csv(dados_pdf, nome_csv)

nome_zip = "Rol_de_Procedimentos.zip"
zipar(nome_csv, nome_zip, script_dir) 

# Remove os arquivos após a compactação
os.remove(nome_csv)
print(f"Arquivo CSV {nome_csv} excluído após compactação.")
os.remove(pdf_path)
print(f"Arquivo PDF {pdf_nome} excluído após compactação.")
