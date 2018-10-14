require 'rails_helper'

RSpec.describe Article, type: :model do

  describe '.abbreviated_title' do
    context '記事タイトルが20文字未満の場合' do
      it '記事タイトルがそのまま返ること' do
       article = Article.new(title: 'タイトルです')
       expect(article.abbreviated_title).to eq 'タイトルです'
      end
    end
  
    context '記事タイトルが20文字以上の場合' do
      it '記事タイトルが省略されること' do
       article = Article.new(title: 'a'*20)
       expect(article.abbreviated_title).to eq "#{'a'*19}..."
      end
    end
  end
 
  describe '.publish' do
    context '記事が非公開の場合' do
      it '記事が公開になること' do
       article = Article.new(status: :draft)
       article.publish
       expect(article.published?).to be_truthy
     end
    end

    context '記事が公開の場合' do
      it '記事が公開になること' do
       article = Article.new(status: :published)
       article.publish
       expect(article.published?).to be_truthy
      end
    end
  end

end
