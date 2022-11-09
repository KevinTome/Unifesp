#código adaptado dessa fonte:
#https://github.com/ashik0007/mlpr1_iris
from sklearn import naive_bayes, svm, neighbors, ensemble

#import das bibliotecas numpy e pandas
import numpy as np
import pandas as pd

# (1).
df = pd.read_csv('iris.data.csv')  
data = np.array(df)

# (2).
np.random.shuffle(data)

# (3).
X_train = np.array(data[0:105, 0:4])  
y_train = np.array(data[0:105, 4])

# (4).
X_test = np.array(data[105:150, 0:4])  
y_test = np.array(data[105:150, 4])

# (5).
clf = svm.SVC(C=10, kernel='poly')

# (6).
clf.fit(X_train, y_train) 

# (7).
esperado = clf.predict(X_test)  
precisao = clf.score(X_test, y_test)

# (8). 
print('Precisão: ', precisao * 100, '%')
print('Saídas: ', y_test)
print('Saídas esperadas: ', esperado)