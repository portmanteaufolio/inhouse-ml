#!/bin/bash
bq --location=EU mk --dataset movies

bq load --source_format=CSV \
--location=EU \
--autodetect movies.movielens_ratings \
gs://dataeng-movielens/ratings.csv

bq load --source_format=CSV \
--location=EU   \
--autodetect movies.movielens_movies_raw \
gs://dataeng-movielens/movies.csv