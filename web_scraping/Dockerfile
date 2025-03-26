FROM python:3.13.1

WORKDIR /app

COPY . .

RUN pip install requests beautifulsoup4 lxml

CMD ["python", "scraper.py"]