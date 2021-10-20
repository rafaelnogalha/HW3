require 'spec_helper'

describe Movie do
  describe 'searching movie by directors' do
    it 'should call Movie with director' do
      Movie.should_receive(:search_movie_by_director).with('Star Wars')
      Movie.search_movie_by_director('Star Wars')
    end
  end
end