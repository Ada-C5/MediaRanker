require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  describe "Category" do
    it "knows that there are three categories in the fixtures" do
      assert_equal 3, Article.all.count
    end

    it "knows the attributes classes" do
      article_test_two = Article.last
      assert_equal String, article_test_two.title.class
      assert_equal String, article_test_two.author.class
      assert_equal String, article_test_two.description.class
      assert_equal String, article_test_two.photo.class
      assert_equal Fixnum, article_test_two.category_id.class
      assert_equal Fixnum, article_test_two.ranking.class
    end

    it "knows to respond to title, author, description, and photo" do
      article_test = Article.first
      assert_equal "Sale el Sol", article_test.title
      assert_equal "Shakira", article_test.author
      assert_equal nil, article_test.description
      assert_equal "https://archive.org/services/img/mbid-81d8c464-3a7c-40f1-b6f5-7925dd34d2d7", article_test.photo
      assert_equal 4, article_test.ranking
    end
  end
end
