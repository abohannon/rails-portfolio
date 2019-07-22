class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  # custom scope, option 1
  def self.angular
    where(subtitle: 'Angular')
  end
  # custom scope, option 2
  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }

  after_initialize :set_defaults
  # You can set defaults in the migration file, as well as here in the model.
  def set_defaults
    # ||= is a shortcut for if *something* == nill { do something }
    self.main_image ||= 'http://placehold.it/600x400'
    self.thumb_image ||= 'http://placehold.it/350x200'
  end
end
