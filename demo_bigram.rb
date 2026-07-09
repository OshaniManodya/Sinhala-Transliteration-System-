require_relative "lib/sinhala_transliterator_gem"

SinhalaTransliterator::Bigram.train("data/sentence_corpus.txt")


p SinhalaTransliterator::Bigram.predict("මම")

p SinhalaTransliterator::Bigram.predict("මගේ")

p SinhalaTransliterator::Bigram.predict("අපි")