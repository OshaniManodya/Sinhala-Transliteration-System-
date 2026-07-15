require_relative "lib/sinhala_transliterator_gem"

SinhalaTransliterator::Bigram.train(
  "data/sentence_corpus.txt"
)

decoder = SinhalaTransliterator::BeamDecoder.new

candidate_lists = [
  ["මම"],
  ["ගෙඩ්‍ර", "ගෙදර"],
  ["යනව", "යනවා"]
]

result = decoder.decode(candidate_lists)

puts "Selected Sentence:"
puts result.join(" ")