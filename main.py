import kaggle
import zipfile 
zip = zipfile.ZipFile('orders.csv.zip')
zip.extractall() 
zip.close() 


#colocando valores indisponiveis como Null
import pandas as pd 
df = pd.read_csv('orders.csv', na_values=['Not Available','unknown'])


#renomeando colunas para o padrão correto
df.columns = df.columns.str.lower()
df.columns = df.columns.str.replace(' ','_')


#criando novas tables 
df['discount'] = df['list_price']*df['discount_percent']*.01
df['sale_prices'] = df['list_price']-df['discount']
df['profit'] = df['sale_prices']-df['cost_price']


#convertendo tipos de dado das datas para datetime
df['order_date'] = pd.to_datetime(df['order_date'], format= "%Y-%m-%d")
#print(df.dtypes)
df.drop(columns =['list_price', 'cost_price','discount_percent'], inplace = True)

import sqlalchemy as sal
from conection import *

conn = engine.connect()
#testando conexão com a base
""" try:
    result = conn.execute("SELECT 1")
    print("Connection successful")
except Exception as e:
    print("Error connecting to database:", e) """
#adicionando dataframe a base
df.to_sql('df_orders', con=conn, index=False, if_exists = 'append')