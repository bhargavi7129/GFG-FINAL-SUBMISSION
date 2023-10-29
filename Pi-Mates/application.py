from flask import Flask, render_template, request, json
from sklearn.neighbors import NearestNeighbors
from scipy.sparse import csr_matrix
import numpy as np
import pandas as pd

app = Flask(__name__)


@app.route('/')
def intro():
    return render_template('index.html')


@app.route('/home', methods=['GET', 'POST'])
def home():
    return render_template('index.html')

@app.route('/log', methods=['GET', 'POST'])
def log():
    return render_template('logged.html')


@app.route('/recommend', methods=['GET', 'POST'])
def recommend():
    movie_name = request.form.get('movies')
    suggestion_list, genre_list, rating_list = suggest(movie_name=movie_name)
    df = pd.DataFrame(list(zip(suggestion_list, genre_list, rating_list)), columns=['Movie Name', 'Genre', 'Rating'])
    return render_template('test.html', tables=[df.to_html(classes='data')], titles=['Movie List'])

@app.route('/login',methods=['GET', 'POST'])
def login():
    return render_template('login.html')

@app.route('/logout',methods=['GET', 'POST'])
def logout():
    return render_template('index.html')


def suggest(movie_name):
    movie = pd.read_csv('movie.csv')
    rating = pd.read_csv('rating.csv')
    a = rating['userId'].value_counts() > 500
    b = rating['userId'].value_counts()
    p = b[a].index.tolist()
    rating = rating[rating['userId'].isin(p)]
    movie_rating = rating.merge(movie, on="movieId")
    rating_normal = movie_rating.groupby('title')['rating'].count().reset_index()
    rating_normal = rating_normal[rating_normal['rating'] > 100]
    movie_rating = movie_rating.merge(rating_normal, on='title')
    final_movie_list = movie_rating.drop_duplicates(subset=['userId', 'title'])
    final_movie_list.rename(columns={'rating_y': 'num_rating', 'rating_x': 'rating'}, inplace=True)
    movie_pivot = final_movie_list.pivot_table(columns='userId', index='title', values='rating')
    movie_pivot = movie_pivot.fillna(0)
    movie_matrix = csr_matrix(movie_pivot)
    model = NearestNeighbors(algorithm='brute')
    model.fit(movie_matrix)
    recommend_movie_list = []
    index = np.where(movie_pivot.index == movie_name)[0][0]
    distance, suggestion = model.kneighbors(movie_pivot.iloc[index, :].values.reshape(1, -1), n_neighbors=10)
    for i in suggestion[0]:
        recommend_movie_list.append(movie_pivot.index[i])
    genre_list = movie[movie['title'].isin(recommend_movie_list)]['genres'].tolist()
    rating_list = movie[movie['title'].isin(recommend_movie_list)]['ratings'].tolist()
    return recommend_movie_list, genre_list, rating_list


if __name__ == "__main__":
    app.run(debug=True)
