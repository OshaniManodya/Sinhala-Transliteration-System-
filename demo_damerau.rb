require_relative "lib/sinhala_transliterator_gem"

puts SinhalaTransliterator::DamerauLevenshtein.distance("අම්ම", "අම්මා")
puts SinhalaTransliterator::Levenshtein.distance("ඉන්දික", "ගෙදර")
puts SinhalaTransliterator::DamerauLevenshtein.distance("අන්නා", "අම්මා")
puts SinhalaTransliterator::DamerauLevenshtein.distance("form", "from")
