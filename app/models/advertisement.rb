class Advertisement < ApplicationRecord
  has_many :sections
  has_many :articles, through: :sections
end
