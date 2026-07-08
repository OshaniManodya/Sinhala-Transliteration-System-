module SinhalaTransliterator
  module Predictor

    def self.predict(prefix, limit = 5)

      return [] unless MODEL.key?(word)

      MODEL[word]

        .sort_by { |_, count| -count }
        .first(limit)
        .map { |next_word, _| "#{word}#{next_word}" }

    end

  end
end