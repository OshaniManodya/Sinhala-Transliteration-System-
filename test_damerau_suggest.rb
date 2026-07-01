require_relative "lib/sinhala_transliterator_gem"

p SinhalaTransliterator::SpellChecker.suggest("සමන්")
p SinhalaTransliterator::SpellChecker.suggest_damerau("සමන්")