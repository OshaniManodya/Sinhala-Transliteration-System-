module SinhalaTransliterator

  module Autocomplete

    def self.suggest(sentence)

      words = sentence.split

      return [] if words.empty?

      last_word = words.last

      suggestions =
        Bigram.predict(last_word)

      suggestions.map do |word|

        (words[0...-1] + [last_word, word]).join(" ")

      end

    end

  end

end