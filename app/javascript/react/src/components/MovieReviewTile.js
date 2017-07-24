import React from 'react';

const MovieReviewTile = props => {
  return(
    <div className="movie-review-tile">
      <h4 className="movie-name">{props.review.movie.name}</h4>
      <span className="reviewer"><b>Reviewer:</b> {props.review.user.username}</span><br />
      <span className="rating"><b>Rating:</b> {props.review.rating}</span>
      <p className="review-body">{props.review.body}</p>
    </div>
  )
}

export default MovieReviewTile;
