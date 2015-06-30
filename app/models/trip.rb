class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :passengers
end
