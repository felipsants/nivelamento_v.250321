import requests, zipfile, os
from bs4 import BeautifulSoup

url = "https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos"
re = requests.get(url)

OUTPUT_DIR = "output"
PDF_TITLES = ["Anexo I.", "Anexo II."]
PDF_FILES = []

def baixar_pdf(url, filename):
    response = requests.get(url, stream=True)

    if response.status_code == 200:
        with open(filename, 'wb') as f:
            for chunk in response.iter_content(1024):
                f.write(chunk)
        print(f"{filename} baixado com sucesso!")        
        PDF_FILES.append(filename)
    else:
        print(f"Erro ao baixar {filename}: {response.status_code}")

response = requests.get(url)

if response.status_code == 200:
    soup = BeautifulSoup(response.text, "lxml")
    
    for a in soup.find_all("a", href=True):
        link_text = a.text.strip()  # Pega o texto visível do link
        pdf_url = a["href"]

        if link_text in PDF_TITLES:
            full_url = pdf_url if pdf_url.startswith("http") else f"https://www.gov.br{pdf_url}"
            filename = full_url.split("/")[-1]  # Nome do arquivo real
            baixar_pdf(full_url, filename)
    
    zip_filename = os.path.join(OUTPUT_DIR,"anexos.zip")
    with zipfile.ZipFile(zip_filename, "w") as zipf:
        for pdf in PDF_FILES:
            zipf.write(pdf, os.path.basename(pdf))
    print(f"Arquivo ZIP '{zip_filename}' criado com sucesso!")

    for pdf in PDF_FILES:
        os.remove(pdf)
        print(f"Removido: {pdf}")
else:
    print("Erro ao acessar a página:", response.status_code)

