require_relative "test_helper"

class TestTransliterator < Minitest::Test

  def test_rule_based
    result = SinhalaTransliterator.convert("amma", mode: :rule)

    refute_nil result
    refute_equal "", result
  end

  def test_dictionary_based
    result = SinhalaTransliterator.convert("amma", mode: :dictionary)

    assert_equal "අම්මා", result
  end

  def test_hybrid_based
    result = SinhalaTransliterator.convert("amma", mode: :hybrid)

    assert_equal "අම්මා", result
  end

end