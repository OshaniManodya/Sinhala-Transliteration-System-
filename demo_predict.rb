require_relative "lib/sinhala_transliterator_gem"

puts SinhalaTransliterator::Predictor.predict("ma")

puts SinhalaTransliterator::Predictor.predict("am")

puts SinhalaTransliterator::Predictor.predict("ko")

puts SinhalaTransliterator::Predictor.predict("ge")