require_relative "lib/sinhala_transliterator_gem"

puts "Loaded words: #{SinhalaTransliterator::SpellDictionary::WORDS.size}"

puts SinhalaTransliterator::SpellChecker.correct?("අම්මා")
puts SinhalaTransliterator::SpellChecker.correct?("ගෙදර")

puts SinhalaTransliterator::SpellChecker.correct?("අම්ම")
puts SinhalaTransliterator::SpellChecker.correct?("ගෙදර්")