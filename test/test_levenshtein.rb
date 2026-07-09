require_relative "test_helper"

class TestLevenshtein < Minitest::Test

  def test_same_word
    assert_equal(
      0,
      SinhalaTransliterator::Levenshtein.distance(
        "අම්මා",
        "අම්මා"
      )
    )
  end

  def test_missing_character
    assert_equal(
      1,
      SinhalaTransliterator::Levenshtein.distance(
        "අම්ම",
        "අම්මා"
      )
    )
  end

  def test_substitution
    assert_equal(
      1,
      SinhalaTransliterator::Levenshtein.distance(
        "ගෙදර්",
        "ගෙදර"
      )
    )
  end

end