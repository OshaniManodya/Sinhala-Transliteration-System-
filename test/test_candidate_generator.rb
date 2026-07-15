require_relative "test_helper"

class CandidateGeneratorTest < Minitest::Test

  def test_returns_candidates
    candidates = SinhalaTransliterator::CandidateGenerator.generate("amma")

    assert_kind_of Array, candidates
    refute_empty candidates
  end

  def test_contains_expected_word
    candidates = SinhalaTransliterator::CandidateGenerator.generate("amma")

    assert_includes candidates, "අම්මා"
  end

  def test_unknown_word
    candidates = SinhalaTransliterator::CandidateGenerator.generate("xxxxxxxx")

    assert_kind_of Array, candidates
  end

end