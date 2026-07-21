require_relative "lib/sinhala_transliterator_gem"

SinhalaTransliterator::Bigram.train("data/sentence_corpus.txt")


p SinhalaTransliterator::Bigram::MODEL["පොතක්"]
p SinhalaTransliterator::Bigram::MODEL["පොත්"]

puts SinhalaTransliterator::Bigram.score("පොතක්","කියවනවා")
puts SinhalaTransliterator::Bigram.score("පොත්","කියවන්න")

p SinhalaTransliterator::Bigram::MODEL["ඔබට"]
p SinhalaTransliterator::Bigram::MODEL["රාත්‍රී"]

p SinhalaTransliterator::Bigram::MODEL["නිදාගන්න"]
p SinhalaTransliterator::Bigram::MODEL["කලින්"]
p SinhalaTransliterator::Bigram::MODEL["පොතක්"]