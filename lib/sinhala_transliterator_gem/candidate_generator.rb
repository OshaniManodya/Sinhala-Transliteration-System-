module SinhalaTransliterator
  module CandidateGenerator

    def self.generate(word, limit: 5)

      candidates = []

      # Rule-based result
      rule = SinhalaTransliterator.convert(word, mode: :rule)
      candidates << rule unless rule.nil? || rule.empty?

      # Dictionary result
      dictionary = SinhalaTransliterator.convert(word, mode: :dictionary)
      candidates << dictionary unless dictionary.nil? || dictionary.empty?

      # Hybrid result
      hybrid = SinhalaTransliterator.convert(word, mode: :hybrid)
      candidates << hybrid unless hybrid.nil? || hybrid.empty?

      # Remove duplicates
      candidates = candidates.uniq

      # Return only requested number
      candidates.first(limit)

    end

  end
end