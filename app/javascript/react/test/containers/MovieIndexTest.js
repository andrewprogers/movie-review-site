import React from 'react'
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';

import MovieReviewsContainer from '../../src/containers/MovieReviewsContainer';
import MovieReviewTile from '../../src/components/MovieReviewTile';


describe('MovieReviewsContainer', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = mount(<MovieReviewsContainer />)
  })

  it('should render a div with id "latest-movie-reviews"', () => {
    expect(wrapper.find('div#latest-movie-reviews')).toBePresent()
  })

  it('should render an h2 title for the latest reviews', () => {
    expect(wrapper.find('h2').text()).toEqual("Latest Movie Reviews")
  })

  it('renders a series of movie reviews', () => {
    expect(wrapper.find(MovieReviewTile)).toBePresent()
  })
})
