require_relative "lib/sinhala_transliterator_gem"

system = SinhalaTransliterator::ContextTransliterator.new

result = system.transliterate(
  "mama gedara yanawaa"
)

puts result.inspect