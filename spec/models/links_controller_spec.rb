require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  describe 'POST #create' do
    it 'creates a new shortened link' do
      expect {
        post :create, params: { link: { original_url: 'https://example.com' } }
      }.to change(Link, :count).by(1)
    end
  end

  describe 'GET #redirect' do
    it 'redirects to the original URL if the slug exists' do
      link = Link.create!(original_url: 'https://example.com', slug: 'abc123')
      get :redirect, params: { slug: link.slug }
      expect(response).to redirect_to(link.original_url)
    end

    it 'returns a 404 status if the slug does not exist' do
      get :redirect, params: { slug: 'nonexistent' }
      expect(response).to have_http_status(:not_found)
    end
  end
end
