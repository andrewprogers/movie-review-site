import React from 'react';
import MovieReviewTile from '../components/MovieReviewTile'

class MovieReviewsContainer extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      reviews: this.props.initialReviews
    }
    this.updateReviews = this.updateReviews.bind(this);
  }

  updateReviews() {
    fetch('/api/v1/reviews').
    then(response => {
      if (response.ok) {
        return response;
      } else {
        throw new Error("Cannot fetch updated reviews");
      }
    })
    .then(response => response.json())
    .then(json => {
      if (json.reviews[0].updated_at !== this.state.reviews[0].updated_at) {
        this.setState({reviews: json.reviews})
      }
    })
    .catch(err => console.error(err.message))
  }

  componentDidMount() {
    this.updateReviews();
    this.updateInterval = setInterval(this.updateReviews, 1000)
  }

  componentWillUnmount() {
    clearInterval(this.updateInterval);
  }

  render() {
    let reviewTiles = this.state.reviews.map(review => {
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
}


export default MovieReviewsContainer;
