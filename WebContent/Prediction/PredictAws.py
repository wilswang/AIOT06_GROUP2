#!/usr/bin/env python
# coding: utf-8

# ## 連線MariaDB

# In[157]:


#!/usr/bin/python
# pip install mysql-connector-python
# pip install sklearn
# pip install joblib
# pip install xgboost

import mysql.connector as mariadb
from mysql.connector import Error
import pandas as pd
import numpy as np
import sys

connection = mariadb.connect(host='database-1.cr4dw42pglz1.ap-northeast-1.rds.amazonaws.com', user='admin', password='iiiAIOT06', database='healthcare')
cursor = connection.cursor()

if connection.is_connected():

    # 顯示資料庫版本
    db_Info = connection.get_server_info()
    print("資料庫版本：", db_Info)

    # 顯示目前使用的資料庫
    cursor = connection.cursor()
    cursor.execute("SELECT DATABASE();")
    record = cursor.fetchone()
    print("目前使用的資料庫：", record)
    connection.commit()
else:
    print("連線失敗")
    connection.commit()


# In[158]:


Patno = sys.argv[1]
#Patno = 1
test_data = pd.read_sql("SELECT age,gender,height,weight,ap_hi,ap_lo,cholesterol,gluc,smoke,alco,active,bmi FROM ml WHERE Patno=%s", connection, params={Patno})
connection.commit()
test_data.columns
test_data = test_data.astype(float)
print(test_data)
print(type(test_data))


# In[159]:


import joblib 
# Load the model from the file 
XGB_from_joblib = joblib.load('D:\\iii_local\\my_vs_code\\Project_workspace\\FinalProject\\WebContent\\Prediction\\XGBCardioModel.pkl')  

# Use the loaded model to make predictions 
result = XGB_from_joblib.predict(test_data) 
print(result)

result = result.tolist()
print(type(result))


# In[162]:


for i in result:
    if i == 0:
        print(i)
        value1 = 'Safe'
        value2 = Patno
        query = "UPDATE ml SET result=%s WHERE Patno=%s"
        cursor.execute(query,(value1,value2,))
    elif i == 1:
        print(i)
        value1 = 'Danger'
        value2 = Patno
        query = "UPDATE ml SET result=%s WHERE Patno=%s"
        cursor.execute(query,(value1,value2,))
connection.commit()


# In[ ]:





# In[ ]:




