require_relative "test_helper"

class BeamDecoderTest < Minitest::Test

  def setup
    @decoder = SinhalaTransliterator::BeamDecoder.new
  end

  def test_returns_sentence

    candidates = [
      ["මම"],
      ["ගෙඩ්‍ර", "ගෙදර"],
      ["යනව", "යනවා"]
    ]

    result = @decoder.decode(candidates)

    assert_kind_of Array, result
    assert_equal 3, result.size

  end

  def test_first_word

    candidates = [
      ["මම"],
      ["ගෙඩ්‍ර", "ගෙදර"]
    ]

    result = @decoder.decode(candidates)

    assert_equal "මම", result.first

  end

end