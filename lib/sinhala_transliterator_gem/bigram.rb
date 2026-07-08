require "csv"

module SinhalaTransliterator
  module Bigram

    MODEL = Hash.new { |hash, key| hash[key] = Hash.new(0) }

    def self.train(file_path)

      MODEL.clear

      File.foreach(file_path) do |line|

        line = line.strip

        next if line.empty?

        words = line.split

        (0...words.length - 1).each do |i|

          current = words[i]
          next_word = words[i + 1]

          MODEL[current][next_word] += 1

        end
      end

    end

    def self.predict(word, limit = 5)

      return [] unless MODEL.key?(word)

      MODEL[word]
        .sort_by { |_, count| -count }
        .first(limit)
        .map { |next_word, _| next_word }

    end

  end
end