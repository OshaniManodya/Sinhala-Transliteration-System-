module SinhalaTransliterator
  module Predictor

    def self.predict(word, limit = 5)
      return [] unless Bigram::MODEL.key?(word)

      Bigram::MODEL[word]
        .sort_by { |_, count| -count }
        .first(limit)
        .map { |next_word, _| "#{word} #{next_word}" }
    end

  end
end