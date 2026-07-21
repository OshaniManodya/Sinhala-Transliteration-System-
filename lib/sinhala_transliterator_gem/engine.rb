module SinhalaTransliterator
  class Engine

    def self.convert(text, mode: :hybrid)
      words = text.split(/\s+/)

      words.map do |word|
        convert_word(word, mode: mode)
      end.join(" ")
    end

    def self.convert_word(word, mode: :hybrid)

      #puts "Mode = #{mode}"

      if mode == :dictionary
        return Dictionary::WORDS[word.downcase] || "[UNKNOWN]"
      end

      # -----------------------------
      # Hybrid Mode
      # -----------------------------
      if mode == :hybrid
        dictionary_result = Dictionary::WORDS[word.downcase]

        return dictionary_result if dictionary_result
      end

      # -----------------------------
      # Rule-Based Engine
      # -----------------------------
      result = ""
      i = 0

      while i < word.length

        matched = false

        # -----------------------------
        # Independent vowels
        # -----------------------------
        Rules::INDEPENDENT_VOWELS.keys
          .sort_by { |k| -k.length }
          .each do |vowel|

          if word[i..].start_with?(vowel)

            if i == 0
              result << Rules::INDEPENDENT_VOWELS[vowel]

              i += vowel.length
              matched = true
              break
            end
          end
        end

        next if matched

        # -----------------------------
        # Consonants
        # -----------------------------
        consonant = nil

        Rules::CONSONANTS.keys
          .sort_by { |k| -k.length }
          .each do |cons|

          if word[i..].start_with?(cons)
            consonant = cons
            break
          end
        end

        if consonant

          base = Rules::CONSONANTS[consonant]

          i += consonant.length

          vowel_found = false

          Rules::VOWEL_SIGNS.keys
            .sort_by { |k| -k.length }
            .each do |vowel|

            if word[i..].start_with?(vowel)

              result << base
              result << Rules::VOWEL_SIGNS[vowel]

              i += vowel.length

              vowel_found = true

              break
            end
          end

          unless vowel_found
            result << base
            result << Rules::HAL
          end

          # -----------------------------
          # Conjuncts
          # -----------------------------
          

          # -----------------------------
          # Special Signs
          # -----------------------------
          Rules::SPECIAL_SIGNS.each do |key, value|

            if word[i..].start_with?(key)

              result << value

              i += key.length

              break
            end
          end

          next
        end

        # -----------------------------
        # Unknown characters
        # -----------------------------
        result << word[i]

        i += 1
      end

      result
    end
  end
end