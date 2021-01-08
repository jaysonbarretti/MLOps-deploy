# Definindo versao do python para instalacao no Docker:
FROM python:3.7-slim

# Variaveis de ambiente para acesso a aplicacao 'main.py':
# Protegendo as variaveis de ambiente de acesso:
ARG BASIC_AUTH_USERNAME_ARG
ARG BASIC_AUTH_PASSWORD_ARG
# Criando as variaveis de ambiente para acesso:
ENV BASIC_AUTH_USERNAME=$BASIC_AUTH_USERNAME_ARG
ENV BASIC_AUTH_PASSWORD=$BASIC_AUTH_PASSWORD_ARG

# Copiando o arquivo 'requirements' com as dependencias para dentro do Docker:
COPY ./requirements.txt /usr/requirements.txt

# Definindo o diretorio/pasta de trabalho:
WORKDIR /usr

# Instalando dependencias 'requirements' dentro do conteiner do Docker:
RUN pip3 install -r requirements.txt

# Copiando os arquivos principais como 'main.py', etc para o conteiner Docker:
COPY ./src /usr/src
COPY ./models /usr/models

# 'Falando' com o Docker para executar os comandos iniciais:
ENTRYPOINT [ "python3" ]
# O que o Python3 vai executar:
CMD [ "src/app/main.py" ]
