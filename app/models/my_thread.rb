class MyThread < ApplicationRecord
  validates :title, presence: true
  has_many :comments
  belongs_to :user
end
