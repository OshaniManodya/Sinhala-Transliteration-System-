require_relative "test_helper"

class ContextTransliteratorTest < Minitest::Test

  def setup
    @system = SinhalaTransliterator::ContextTransliterator.new
  end

  def test_returns_array

    result = @system.transliterate(
      "mama gedara"
    )

    assert_kind_of Array, result

  end

  def test_sentence_size

    result = @system.transliterate(
      "mama gedara"
    )

    assert_equal 2, result.size

  end

  def test_each_word_returns_candidates

    result = @system.transliterate(
      "mama gedara"
    )

    result.each do |candidates|

      assert_kind_of Array, candidates

      refute_empty candidates

    end

  end

end