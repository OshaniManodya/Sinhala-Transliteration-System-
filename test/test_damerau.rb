require_relative "test_helper"

class TestDamerau < Minitest::Test

  def test_same_word
    assert_equal(
      0,
      SinhalaTransliterator::DamerauLevenshtein.distance(
        "අම්මා",
        "අම්මා"
      )
    )
  end

  def test_missing_character
    assert_equal(
      1,
      SinhalaTransliterator::DamerauLevenshtein.distance(
        "අම්ම",
        "අම්මා"
      )
    )
  end

  def test_transposition
    assert_equal(
      1,
      SinhalaTransliterator::DamerauLevenshtein.distance(
        "AB",
        "BA"
      )
    )
  end

end