require_relative "lib/sinhala_transliterator_gem"
require_relative "lib/sinhala_transliterator_gem/dictionary"

puts "===== RULE ====="
puts SinhalaTransliterator.convert("thaththa")
puts SinhalaTransliterator.convert("gedara")
puts SinhalaTransliterator.convert("karuNaadhhipathi")

puts "\n===== DICTIONARY ====="
puts SinhalaTransliterator.convert("thaththa")
puts SinhalaTransliterator.convert("gedara")

puts "\n===== HYBRID ====="
puts SinhalaTransliterator.convert("thaththa")
puts SinhalaTransliterator.convert("gedara")
puts SinhalaTransliterator.convert("saman")