#!/bin/bash

#./mongodb-database-tools/mongoimport --collection='listingsAndReviews' --file='./mongodb-dataset/sample_airbnb.json' --uri 'mongodb://127.0.0.1:27017/sample_airbnb'
mongoimport --collection='listingsAndReviews' --file='./mongodb-dataset/sample_airbnb.json' --uri 'mongodb://127.0.0.1:27017/sample_airbnb'
