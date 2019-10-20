require 'rails_helper'

RSpec.describe Article, type: :model do
  it "is not valid without a title" do
  book = Article.new(title: nil)
  expect(book).to_not be_valid
end
end
