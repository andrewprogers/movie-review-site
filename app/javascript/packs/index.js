import React from 'react';
import ReactDOM from 'react-dom';
import MovieReviewsContainer from '../react/src/containers/MovieReviewsContainer';
import reviews_data from '../react/test/constants/reviews_data'

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <MovieReviewsContainer
      initialReviews={reviews_data.reviews}/>
    , document.getElementById('app'));
})
