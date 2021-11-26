# id
# title
# author
# content
# published
# published_at
# created_at
# updated_at

class Article < ApplicationRecord
  # validates :title, presence: true
  # validates :author, presence: true
  # validates :content, presence: true

  validates :title, :author, :content, presence: true

  has_many :comments

  def full_description
    #errors.add(:base, "something")
    "#{title} - #{author}"
  end
end
