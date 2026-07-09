require_relative "lib/sinhala_transliterator_gem"

puts SinhalaTransliterator::SpellChecker.suggest("අම්ම").inspect
puts SinhalaTransliterator::SpellChecker.suggest("ගෙදර්").inspect
puts SinhalaTransliterator::SpellChecker.suggest("සමන").inspect