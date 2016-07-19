require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  describe "Category" do
    it "knows that there are three categories" do
      assert_equal 3, Category.all.count
    end

    it "knows that categories have 'name'" do
      assert_equal "movies", Category.first.name
      assert_equal "albums", Category.last.name
    end
  end
end
