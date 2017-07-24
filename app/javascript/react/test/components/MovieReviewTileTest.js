import React from 'react'
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';

import MovieReviewTile from '../../src/components/MovieReviewTile';

describe('MovieReviewTile', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = mount(<MovieReviewTile />)
  })

  it('should render a div with class "movie-review-tile"', () => {
    expect(wrapper.find('div.movie-review-tile')).toBePresent();
  })

  it('should render the movie name')
})
