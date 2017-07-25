let createVote = (reviewId, reviewValue) => {
  let formPayload = {value: reviewValue}
  fetch(`/api/v1/reviews/${reviewId}/votes`, {
    method: 'POST',
    body: JSON.stringify(formPayload)
  })
}

document.addEventListener("DOMContentLoaded", () => {
  let upvotes = document.getElementsByClassName('upvote');
  for (var i = 0; i < upvotes.length; i++) {
    let reviewId = parseInt(upvotes[i].classList[1].split('-')[1])

    upvotes[i].addEventListener('click', () => {
      createVote(reviewId, 1)
    })
  }

  let downvotes = document.getElementsByClassName('downvote');
  for (var i = 0; i < downvotes.length; i++) {
  let reviewId = parseInt(downvotes[i].classList[1].split('-')[1])

  downvotes[i].addEventListener('click', () => {
    createVote(reviewId, -1)
  })
}
})
