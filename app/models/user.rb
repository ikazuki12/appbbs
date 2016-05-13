class User < ActiveRecord::Base
  belongs_to :branch
  belongs_to :position
  has_many :messages
  has_many :comments
end
