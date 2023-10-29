import numpy as np 
import pandas as pd
import customtkinter as ct
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.metrics.pairwise import cosine_similarity
import nltk
from nltk.stem.porter import PorterStemmer
import pickle


ps=PorterStemmer()
cv=CountVectorizer(max_features=3500,stop_words='english')
cv2=CountVectorizer(max_features=5000,stop_words='english')

places = pd.read_csv("Places.csv")
City = pd.read_csv("City.csv")


'''
POPULARITY MODEL

places_with_city = places.merge(places,on='City')
print(places_with_city)


num_rating_df=places_with_city.groupby('City').count().reset_index()
num_rating_df.rename(columns={'Ratings':'num_Ratings'})

print(num_rating_df)
'''

new_df = City[['City','Ratings','City_desc']]
print(new_df)

new_df2 = places[['Place_Trim','Ratings','Place_desc']]
print(new_df2)

places_city = City.merge(places,on='City')
print(places_city)

new_df3 = places_city[['City','Place_Trim','City_desc','Place_desc']]
print(new_df3)



#Recommend City 

def stem(text):
    y=[]

    for i in text.split():
        y.append(ps.stem(i))
    return " ".join(y)  

new_df['City_desc']=new_df['City_desc'].apply(stem)
print(new_df['City_desc'])


vectors=cv.fit_transform(new_df['City_desc']).toarray()
print(cv.get_feature_names_out())

similarity=cosine_similarity(vectors)

def recommend(City1):
    City_index = new_df[new_df['City']==City1].index[0]
    distances = similarity[City_index]
    City_List = sorted(list(enumerate(distances)),reverse=True,key=lambda x:x[1])[1:5]
    
    for i in City_List:
        print(new_df.iloc[i[0]].City)
        

print(recommend("Andaman"))




#Recommend Place


new_df3['Place_desc']=new_df3['Place_desc'].apply(stem)
print(new_df3['Place_desc'])

vectors1=cv2.fit_transform(new_df3['Place_desc']).toarray()
print(cv2.get_feature_names_out())

similarity1=cosine_similarity(vectors1)
print(similarity1)


print(new_df2)
def recommend1(place1):
    Place_index = new_df3[new_df3['Place_Trim']==place1].index[0]
    distances = similarity1[Place_index]
    Place_List = sorted(list(enumerate(distances)),reverse=True,key=lambda x:x[1])[1:5]
    
    for i in Place_List:
        print(new_df3.iloc[i[0]].Place_Trim)

print(recommend1("Capture the Sceneries of Old Manali"))




pickle.dump(new_df.to_dict(),open('City23_dict','wb'))
pickle.dump(new_df3.to_dict(),open('CP23_dict','wb'))
pickle.dump(similarity,open('similarity','wb'))
pickle.dump(similarity1,open('similarity1','wb'))




