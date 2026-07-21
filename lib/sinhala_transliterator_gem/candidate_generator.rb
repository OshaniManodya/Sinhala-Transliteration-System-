module SinhalaTransliterator
  module CandidateGenerator

    def self.generate(word, limit: 10)

      candidates = []

      # ----------------------------------------------------
      # Dictionary Candidate (Highest Confidence)
      # ----------------------------------------------------
      dictionary = SinhalaTransliterator.convert(word, mode: :dictionary)
      puts "Roman      : #{word}"
      puts "Dictionary : #{dictionary}"
      puts

      if dictionary && !dictionary.empty? && dictionary != "[UNKNOWN]"
        candidates << { word: dictionary, bonus: 3.0 }
      end

      # ----------------------------------------------------
      # Hybrid Candidate
      # ----------------------------------------------------
      hybrid = SinhalaTransliterator.convert(word, mode: :hybrid)

      if hybrid && !hybrid.empty? && hybrid != "[UNKNOWN]"
        candidates << { word: hybrid, bonus: 2.0 }
      end

      # ----------------------------------------------------
      # Rule-based Candidate
      # ----------------------------------------------------
      rule = SinhalaTransliterator.convert(word, mode: :rule)

      if rule && !rule.empty? && rule != "[UNKNOWN]"
        candidates << { word: rule, bonus: 1.0 }
      end

      # ----------------------------------------------------
      # Spell Suggestions (Levenshtein)
      # ----------------------------------------------------
      if rule && !rule.empty? && rule != "[UNKNOWN]"

        SpellChecker.suggest(rule, limit: 5).each do |w|
          candidates << { word: w, bonus: 0.5 }
        end

        SpellChecker.suggest_damerau(rule, limit: 5).each do |w|
          candidates << { word: w, bonus: 0.5 }
        end

      end

      # ----------------------------------------------------
      # Remove duplicate words
      # Keep the highest bonus if duplicates exist
      # ----------------------------------------------------

      unique_candidates = {}

      candidates.each do |candidate|

        word = candidate[:word]

        if !unique_candidates.key?(word) ||
           candidate[:bonus] > unique_candidates[word][:bonus]

          unique_candidates[word] = candidate

        end

      end

      # ----------------------------------------------------
      # Sort by confidence (Highest First)
      # ----------------------------------------------------

      unique_candidates
        .values
        .sort_by { |candidate| -candidate[:bonus] }
        .first(limit)

    end

  end
end