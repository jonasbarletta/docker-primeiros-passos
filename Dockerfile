# Escolhe a Imagem
FROM python:3.13

# Instala bibliotecas que não são padrão da Imagem python
RUN pip install poetry

# Nesse momento ele irá criar uma nova imagem, a partir da selecionada anteriormente
# Esse comando vai pegar tudo que está na pasta + o que definimos anteriormente e jogar em uma pasta chamada src, na nova Imagem
COPY . /src

# Diretório de trabalho
WORKDIR /src

# Como estamos utilizando o poetry, temos que rodar o poetry install
RUN poetry install

# Como estamos rodando um app com streamlit, precisamos indicar para deixar a porta do streamlit aberta
EXPOSE 8501

# Entrypoint é o que queremos escrever no terminal
ENTRYPOINT [ "poetry", "run", "streamlit", "run", "app.py"]

