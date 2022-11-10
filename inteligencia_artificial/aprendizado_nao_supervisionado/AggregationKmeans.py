#Aggregation
#K-means
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

from sklearn.cluster import KMeans

data = pd.read_csv('Aggregation.csv')

X = np.array(data)
kmeans = KMeans(n_clusters=int(max(data['C'])), random_state = 0).fit(X)
plt.scatter(X[:,0], X[:,1],c=kmeans.labels_)
plt.show()


