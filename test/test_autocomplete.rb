require_relative "test_helper"

class TestAutocomplete < Minitest::Test

  def setup
    SinhalaTransliterator::Bigram.train("data/sentence_corpus.txt")
  end

  def test_autocomplete

    suggestions =
      SinhalaTransliterator::Predictor.predict("මම")

    assert suggestions.length > 0

  end

end