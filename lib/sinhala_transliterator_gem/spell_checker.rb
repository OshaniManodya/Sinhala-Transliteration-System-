module SinhalaTransliterator
  module SpellChecker

    def self.correct?(word)
    SpellDictionary::WORDS.include?(word)
    end

    def self.suggest(word,limit:5)
      candidates=SpellDictionary::WORDS.select do |candidate|
        #similar first character 
        candidate[0] == word[0] && 
        #similar length (within 2 characters)
        (candidate.length - word.length).abs <=2
      end
      candidates
      .map do |candidate|
        [
          candidate,
          SinhalaTransliterator::Levenshtein.distance(word, candidate)
        ]
      end.sort_by { |candidate, distance| distance }
      .uniq
      .first(limit)
      .map(&:first)
    end

    def self.suggest_damerau(word,limit:5)
      candidates=SpellDictionary::WORDS.select do |candidate|
        #similar first character 
        candidate[0] == word[0] && 
        #similar length (within 2 characters)
        (candidate.length - word.length).abs <=2
      end

      candidates
      .uniq
      .map do |candidate|
        [
          candidate,
          SinhalaTransliterator::DamerauLevenshtein.distance(word, candidate)
        ]
      end.sort_by { |candidate, distance| distance }
      .uniq
      .first(limit)
      .map(&:first)
    end

    



  end
end