require_relative "test_helper"

class TestBigram < Minitest::Test

  def setup
    SinhalaTransliterator::Bigram.train("data/sentence_corpus.txt")
  end

  def test_prediction

    predictions =
      SinhalaTransliterator::Bigram.predict("මම")

    assert_includes predictions, "ගෙදර"

  end

end