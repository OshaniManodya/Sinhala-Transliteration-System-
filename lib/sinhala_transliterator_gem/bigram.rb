require "csv"

module SinhalaTransliterator
  module Bigram

    MODEL = Hash.new { |hash, key| hash[key] = Hash.new(0) }
    TOTALS = Hash.new(0)

    # ----------------------------------------------------
    # Train Bigram Model
    # ----------------------------------------------------

    def self.train(file_path)

      MODEL.clear
      TOTALS.clear

      File.foreach(file_path) do |line|

  line = line.strip
  next if line.empty?

  # Remove punctuation
  line = line.gsub(/[.,!?;:]/, "")

  words = line.split

  (0...words.length - 1).each do |i|

          current = words[i]
          next_word = words[i + 1]

          MODEL[current][next_word] += 1
          TOTALS[current] += 1

        end

      end

    end

    # ----------------------------------------------------
    # Next Word Prediction (existing feature)
    # ----------------------------------------------------

    def self.predict(word, limit = 5)

      return [] unless MODEL.key?(word)

      MODEL[word]
        .sort_by { |_, count| -count }
        .first(limit)
        .map { |next_word, _| next_word }

    end

    # ----------------------------------------------------
    # Probability
    # ----------------------------------------------------

    def self.probability(previous_word, current_word)

      return 0.0001 unless MODEL.key?(previous_word)

      count = MODEL[previous_word][current_word]

      return 0.0001 if count == 0

      count.to_f / TOTALS[previous_word]

    end

    # ----------------------------------------------------
    # Log Probability
    # ----------------------------------------------------

    def self.score(previous_word, current_word)

      Math.log(
        probability(previous_word, current_word)
      )

    end

  end
end