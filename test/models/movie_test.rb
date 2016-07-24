require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "has a title" do
    assert movies(:has_all_fields).title
  end

  

end
