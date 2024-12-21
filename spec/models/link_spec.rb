require 'rails_helper'

RSpec.describe Link, type: :model do
  describe 'validations' do
    it 'is valid with a valid original_url and unique slug' do
      link = Link.new(original_url: 'https://example.com', slug: 'abc123')
      expect(link).to be_valid
    end



  end
end
