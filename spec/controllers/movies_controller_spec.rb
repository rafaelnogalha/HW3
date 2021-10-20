require 'rails_helper'

describe MoviesController do
  describe 'searching tmdb' do
    before :each do
      @fr = [double('m1'), double('m2')]
    end
    it 'calls the model method tmdb search' do
      expect(Movie).to receive(:find_in_tmdb).with('hardware').
        and_return(@fr)
      post :search_tmdb, :params => {:search_terms => 'hardware'}
    end
    describe 'after valid search' do
      before :each do
        allow(Movie).to receive(:find_in_tmdb).and_return(@fr)
        post :search_tmdb, :params => {:search_terms => 'hardware'}
      end
      it 'selects the Search Results template for rendering' do
        expect(response).to render_template('search_tmdb')
      end
      it 'makes the tmdb search results available to that template' do
        expect(assigns(:movies)).to eq(@fr)
      end
    end
  end
  describe 'adding new movie' do
    it 'shows view of Add movie as new' do
    end
  end
end