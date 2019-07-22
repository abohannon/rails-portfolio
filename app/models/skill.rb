class Skill < ApplicationRecord
  include Placeholder
  validates_presence_of :title, :percent_utilized

  after_initialize :set_defaults
  # You can set defaults in the migration file, as well as here in the model.
  def set_defaults
    # ||= is a shortcut for if *something* == nill { do something }
    self.badge ||= Placeholder.image_generator(height: '250', width: '250')
  end
end
