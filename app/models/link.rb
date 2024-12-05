class Link < ApplicationRecord
  validates :original_url, presence: true, on: :create
  validates :slug, uniqueness: true

  before_create :generate_unique_slug

  private

  def generate_unique_slug
    self.slug = loop do
      random_slug = SecureRandom.alphanumeric(6)
      break random_slug unless Link.exists?(slug: random_slug)
    end
  end
end
