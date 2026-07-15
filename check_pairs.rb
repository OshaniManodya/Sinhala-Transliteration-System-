require_relative "lib/sinhala_transliterator_gem"

SinhalaTransliterator::Bigram.train("data/sentence_corpus.txt")

puts SinhalaTransliterator::Bigram::MODEL["ගෙදර"]