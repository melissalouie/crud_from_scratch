class Update < ActiveRecord::Base
  validates :user, presence: true
  validates :status, presence: true
end
