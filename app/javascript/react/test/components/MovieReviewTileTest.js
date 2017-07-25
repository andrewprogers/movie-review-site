import React from 'react'
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';

import reviews_data from '../constants/reviews_data'
import MovieReviewTile from '../../src/components/MovieReviewTile';

describe('MovieReviewTile', () => {
  let wrapper;
  let reviews = reviews_data.reviews

  beforeEach(() => {
    wrapper = mount(
      <MovieReviewTile
      review={reviews[1]}/>)
  })

  it('should render a div with class "movie-review-tile"', () => {
    expect(wrapper.find('div.movie-review-tile')).toBePresent();
  })

  it('should show the movie name', () => {
    expect(wrapper.find('.movie-name').first().text()).toEqual(reviews[1].movie.name)
  })

  it('should show the username of the reviewer', () => {
    expect(wrapper.find('.reviewer').first().text()).toEqual(`Reviewer: ${reviews[1].user.username}`)
  })

  it('should show the rating', () => {
    expect(wrapper.find('.rating').first().text()).toEqual(`Rating: ${reviews[1].rating}`)
  })

  it('should show the body, if there is one', () => {
    expect(wrapper.find('.review-body').first().text()).toEqual(reviews[1].body)
  })
})
