require_relative "lib/sinhala_transliterator_gem"

SinhalaTransliterator::Bigram.train("data/sentence_corpus.txt")

puts "P(ගෙදර | මම)"
puts SinhalaTransliterator::Bigram.probability("මම", "ගෙදර")

puts

puts "P(ගෙඩ්‍ර | මම)"
puts SinhalaTransliterator::Bigram.probability("මම", "ගෙඩ්‍ර")