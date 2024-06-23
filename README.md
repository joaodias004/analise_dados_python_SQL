# analise_dados_python_SQL
# PORTUGUESE:   
Visão Geral do Projeto

Este projeto envolve a análise de um conjunto de dados de pedidos baixados da API do Kaggle. O conjunto de dados está armazenado em um arquivo CSV chamado orders.csv, que está compactado em um arquivo zip.

Preparação dos Dados

O script em Python extrai o arquivo zip, lê o arquivo CSV em um DataFrame do Pandas e realiza as seguintes etapas de preparação dos dados:

Substitui valores ausentes por valores nulos
Renomeia os nomes das colunas para minúsculas e substitui espaços por sublinhados
Cria novas colunas para desconto, preços de venda e lucro
Converte a coluna order_date para o formato datetime
Remove colunas desnecessárias
Carregamento dos Dados

O DataFrame preparado é então carregado em um banco de dados (SQL SERVER) usando a biblioteca SQLAlchemy. A conexão com o banco de dados é estabelecida usando uma string de conexão armazenada em um arquivo separado chamado conection.py (Driver = ODBC).

Consultas SQL

As consultas SQL fornecidas neste projeto realizam as seguintes análises:

Recuperar todos os dados da tabela df_orders
Identificar os 5 principais produtos por vendas para cada região
Calcular as vendas totais e o lucro por estado
Calcular as vendas totais e o lucro por segmento
Identificar a cidade com maior lucro para cada região
Requisitos Técnicos

Python 3.x
Biblioteca Pandas
Biblioteca SQLAlchemy
String de conexão com o banco de dados (armazenada no arquivo conection.py)
Como Executar

Extraia o arquivo orders.csv.zip para um diretório de sua escolha.
Execute o script em Python para preparar os dados e carregá-los no banco de dados.
Execute as consultas SQL para realizar as análises desejadas.
Nota: Pode ser necessário modificar a string de conexão com o banco de dados no arquivo conection.py para corresponder à configuração específica do seu banco de dados.

# ENGLISH:  
Project Overview

This project involves analyzing a dataset of orders downloaded from the keggal API. The dataset is stored in a CSV file named orders.csv, which is compressed in a zip file.

Data Preparation

The Python script extracts the zip file, reads the CSV file into a Pandas DataFrame, and performs the following data preparation steps:

Replaces missing values with null values
Renames column names to lowercase and replaces spaces with underscores
Creates new columns for discount, sale prices, and profit
Converts the order_date column to a datetime format
Drops unnecessary columns
Data Loading

The prepared DataFrame is then loaded into a database (SQL SERVER) using the SQLAlchemy library. The database connection is established using a connection string stored in a separate file named conection.py (Driver = ODBC).

SQL Queries

The SQL queries provided in this project perform the following analyses:

Retrieve all data from the df_orders table
Identify the top 5 products by sales for each region
Calculate the total sales and profit by state
Calculate the total sales and profit by segment
Identify the top city by profit for each region
Technical Requirements

Python 3.x
Pandas library
SQLAlchemy library
Database connection string (stored in conection.py file)
How to Run

Extract the orders.csv.zip file to a directory of your choice.
Run the Python script to prepare the data and load it into the database.
Execute the SQL queries to perform the desired analyses.
Note: You may need to modify the database connection string in the conection.py file to match your specific database setup.
