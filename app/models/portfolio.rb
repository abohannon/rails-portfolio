class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies, 
                                reject_if: lambda { |attrs| attrs['name'].blank? }

  include Placeholder

  validates_presence_of :title, :body, :main_image, :thumb_image

  # custom scope, option 1
  def self.angular
    where(subtitle: 'Angular')
  end
  # custom scope, option 2 (lambda)
  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }

  after_initialize :set_defaults
  # You can set defaults in the migration file, as well as here in the model.
  def set_defaults
    # ||= is a shortcut for if *something* == nill { do something }
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end
end
