require_relative "sinhala_transliterator_gem/version"
require_relative "sinhala_transliterator_gem/rules"
require_relative "sinhala_transliterator_gem/dictionary"
require_relative "sinhala_transliterator_gem/engine"
require_relative "sinhala_transliterator_gem/spell_dictionary"
require_relative "sinhala_transliterator_gem/spell_checker"
require_relative "sinhala_transliterator_gem/levenshtein"
require_relative "sinhala_transliterator_gem/damerau_levenshtein"
require_relative "sinhala_transliterator_gem/predictor"
require_relative "sinhala_transliterator_gem/bigram"
require_relative "sinhala_transliterator_gem/autocomplete"


module SinhalaTransliterator
  def self.convert(text, mode: :hybrid)
    Engine.convert(text, mode: mode)
  end
end