import streamlit as st
import pickle
import pandas as pd

city_list = pickle.load(open("City23_dict",'rb'))
similarity = pickle.load(open("similarity",'rb'))
similarity1 = pickle.load(open("similarity1",'rb'))
place_list= pickle.load(open('CP23','rb'))
place=pd.DataFrame(place_list)
city=pd.DataFrame(city_list)


def recommend(City1):
    City_index = city[city['City']==City1].index[0]
    distances = similarity[City_index]
    City_List = sorted(list(enumerate(distances)),reverse=True,key=lambda x:x[1])[1:5]
    
    recommended_city = []
    for i in City_List:
        recommended_city.append(city.iloc[i[0]].City)
    return recommended_city


def recommend1(place1):
    Place_index = place[place['Place_Trim']==place1].index[0]
    distances = similarity1[Place_index]
    Place_List = sorted(list(enumerate(distances)),reverse=True,key=lambda x:x[1])[1:5]
    
    recommended_place = []
    for i in Place_List:
        recommended_place.append(place.iloc[i[0]].Place_Trim)
    return recommended_place



st.title("Destination Recommendor System")

option = st.selectbox(
"Like Which City you want to visit again",
city['City'].values
)

if st.button("Recommend City"):
    recommendations = recommend(option)
    for i in recommendations:
        st.write(i)

option2 = st.selectbox(
"Like Which place you want to visit again",
place['Place_Trim'].values
)

if st.button("Recommend Place"):
    recommendations = recommend1(option2)
    for i in recommendations:
        st.write(i)
