import React from 'react';
import MovieReviewTile from '../components/MovieReviewTile'

const MovieReviewsContainer = props => {
  let reviewTiles = props.initialReviews.map(review => {
    return(
      <MovieReviewTile
        key={review.id}
        review={review}
        />
    )
  })
  return(
    <div id="latest-movie-reviews">
      <h2>Latest Movie Reviews</h2>
      {reviewTiles}
    </div>
  )
}

export default MovieReviewsContainer;
