# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  has_one_attached :avatar
  has_many_attached :photos
  has_one_attached :image_regex

  validates :name, presence: true

  validates :avatar, attached: true, content_type: :png
  validates :photos, attached: true, content_type: ['image/png', 'image/jpg']
  validates :image_regex, content_type: /\Aimage\/.*\z/
end
