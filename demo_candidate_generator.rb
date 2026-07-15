require_relative "lib/sinhala_transliterator_gem"

puts "Candidates for 'amma'"
p SinhalaTransliterator::CandidateGenerator.generate("amma")

puts

puts "Candidates for 'gedara'"
p SinhalaTransliterator::CandidateGenerator.generate("gedara")

puts

puts "Candidates for 'kohomada'"
p SinhalaTransliterator::CandidateGenerator.generate("kohomada")