module SinhalaTransliterator

  class ContextTransliterator

    def initialize

      @decoder = BeamDecoder.new

    end

    def transliterate(sentence)

      candidate_lists = sentence.split.map do |word|
        CandidateGenerator.generate(word)
      end

      @decoder.decode(candidate_lists).join(" ")

    end

  end

end