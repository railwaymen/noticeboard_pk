class Post < ActiveRecord::Base
  belongs_to :user

  validates :user, :title, :content, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  acts_as_taggable
end
