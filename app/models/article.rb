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

  validates :title, presence: true, uniqueness: {scope: 'title', message: 'should be unique'}
  validates :author, :content, presence: true
  has_many :comments

  has_and_belongs_to_many :tags

  has_and_belongs_to_many :categories

  has_many :sections
  has_many :advertisements, through: :sections

  accepts_nested_attributes_for :sections
  accepts_nested_attributes_for :categories

  # accepts_nested_attributes_for :stores, :reject_if => :check_store

  # protected

  # def check_store(store_attr)
  #   if _store = Store.find(store_attr['id'])
  #     self.store = _store
  #     return true
  #   end
  #   return false
  # end

  before_validation :set_content, if: :content_is_empty?
  # after_initialize :set_content
  # after_save :set_comment
  after_create :set_comment       #every update, set a comment

  def set_content
    self.content = 'Default Content' if self.content.nil?
    # self.content ||= 'Default Content'
  end

  def set_comment
    Comment.create(article: self, content: 'Default Comment')
  end

  def content_is_empty?
    return self.content.blank?
  end

  def full_description
    #errors.add(:base, "something")
    "#{title} - #{author}"
  end
end
