require_relative "test_helper"

class TestSpellChecker < Minitest::Test

  def test_spell_suggestion

    suggestions =
      SinhalaTransliterator::SpellChecker.suggest("අම්ම")

    assert_includes suggestions, "අම්මා"

  end

  def test_correct_word

    suggestions =
      SinhalaTransliterator::SpellChecker.suggest("ගෙදර්")

    assert_includes suggestions, "ගෙදර"

  end

end