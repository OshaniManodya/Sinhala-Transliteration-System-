require_relative "test_helper"

class BigramScoreTest < Minitest::Test

  def setup
    SinhalaTransliterator::Bigram.train(
      "data/sentence_corpus.txt"
    )
  end

  def test_probability

    p = SinhalaTransliterator::Bigram.probability(
      "මම",
      "ගෙදර"
    )

    assert p > 0

  end

  def test_score

    score = SinhalaTransliterator::Bigram.score(
      "මම",
      "ගෙදර"
    )

    assert_kind_of Float, score

  end

end