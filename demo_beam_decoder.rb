require_relative "lib/sinhala_transliterator_gem"

SinhalaTransliterator::Bigram.train(
  "data/sentence_corpus.txt"
)

decoder = SinhalaTransliterator::BeamDecoder.new

candidate_lists = [
  ["මම"],
  ["ගෙද්‍ර", "ගෙදර"],
  ["යනව", "යනවා"]
]

beam = decoder.decode(candidate_lists)

puts "Best Sentence:"
puts beam.sentence.join(" ")

puts
puts "Score:"
puts beam.score