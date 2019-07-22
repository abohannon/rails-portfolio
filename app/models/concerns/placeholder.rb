module Placeholder
  # loads in some helper modules
  extend ActiveSupport::Concern

  def self.image_generator(height:, width:)
    "http://placehold.it/#{height}x#{width}"
  end
end
