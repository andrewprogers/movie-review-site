let countVotes = (votes) => {
  let up = 0;
  let down = 0;
  for (var i = 0; i < votes.length; i++) {
    if (votes[i].value === 1) {
      up += 1;
    } else if (votes[i].value === -1){
      down += 1;
    }
  }
  return {
    up: up,
    down: down,
    total: up - down
  }
}

let createVote = (reviewId, reviewValue, callback) => {
  let formPayload = {value: reviewValue}
  fetch(`/api/v1/reviews/${reviewId}/votes`, {
    method: 'POST',
    credentials: 'same-origin',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(formPayload)
  })
  .then(response => {
    if (response.ok) {
      return response;
    } else {
      throw new Error('Error updating votes');
    }
  })
  .then(response => response.json())
  .then(json => json.votes)
  .then(votes => countVotes(votes))
  .then(count => callback(count))
}

document.addEventListener("DOMContentLoaded", () => {
  let upvotes = document.getElementsByClassName('upvote');
  for (var i = 0; i < upvotes.length; i++) {
    let reviewId = parseInt(upvotes[i].classList[1].split('-')[1])

    upvotes[i].addEventListener('click', (event) => {
      event.preventDefault();
      createVote(reviewId, 1, (count) => {
        let votesDigest = document.getElementById(`votes-review-${reviewId}`)
        votesDigest.innerHTML = `Total Votes: ${count.total}`
      })
    })
  }

  let downvotes = document.getElementsByClassName('downvote');
  for (var i = 0; i < downvotes.length; i++) {
    let reviewId = parseInt(downvotes[i].classList[1].split('-')[1])

    downvotes[i].addEventListener('click', (event) => {
      event.preventDefault();
      createVote(reviewId, -1, (count) => {
        let votesDigest = document.getElementById(`votes-review-${reviewId}`)
        votesDigest.innerHTML = `Total Votes: ${count.total}`
      })
    })
  }
})
