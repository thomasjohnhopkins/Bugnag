class Bug < ApplicationRecord

  validates :title, :body, presence: true
  validates :body, length: { minimum: 20 }

  belongs_to :user
end
