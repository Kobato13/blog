require 'rails_helper'

RSpec.describe Article, type: :model do

  let!(:article) {Article.new}

  context 'Validations' do
    it "is not a valid name" do
      article.title = nil
      article.content = 'Test Content'

      expect(article).to_not be_valid
      expect(article.errors).to be_present
      expect(article.errors.to_hash.keys).to include(:title)
    end

    it 'should be unique' do
      Article.create(:title => 'Duplicate Name', 
        :author => 'author 1', :content => 'Body')
      article.title = 'Duplicate Name'
      article.author = 'author 1'
      article.content = 'Content'

      expect(article).to_not be_valid
      expect(article.errors).to be_present
      expect(article.errors.to_hash.keys).to include(:title)
      expect(article.errors[:title]).to include('should be unique')

    end
  end

end