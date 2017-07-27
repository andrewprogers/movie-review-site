import React from 'react';

const MovieReviewTile = props => {
  let imageSrc
  console.log(props.review)
  if (props.review.movie.poster) {
    imageSrc = props.review.movie.poster.thumb.url;
  }
  let movieLink = `/movies/${props.review.movie.id}`
  return(
    <div className="movie-review-tile">
      <div className="row">
        <div className="thumb-container">
          <img src={imageSrc} />
        </div>
        <div className="small-10 columns">
          <a href={movieLink}>
            <span className="movie-name">{props.review.movie.name}</span>
          </a>
          <span className="rating"><b>Rating:</b> {props.review.rating}</span>
          <span className="reviewer"><b> - Reviewed By:</b> {props.review.user.username}</span><br />
          <hr />
          <p className="review-body">{props.review.body}</p>
        </div>
      </div>
    </div>
  )
}

export default MovieReviewTile;
