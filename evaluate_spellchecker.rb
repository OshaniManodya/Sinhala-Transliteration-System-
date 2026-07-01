require "csv"
require "benchmark"
require_relative "lib/sinhala_transliterator_gem"

top1_lev = 0
top3_lev = 0
top5_lev = 0

top1_dam = 0
top3_dam = 0
top5_dam = 0

lev_time = 0
dam_time = 0

total = 0

CSV.foreach("data/spell_evaluation.csv", headers: true) do |row|

  noisy = row["noisy"]
  correct = row["correct"]

  puts "Noisy=#{noisy.inspect}, Correct=#{correct.inspect}"

  next if noisy.nil? || noisy.strip.empty?
  next if correct.nil? || correct.strip.empty?

  total += 1

  # Levenshtein
  time = Benchmark.realtime do
    @lev = SinhalaTransliterator::SpellChecker.suggest(noisy)
  end

  lev_time += time

  top1_lev += 1 if @lev[0] == correct
  top3_lev += 1 if @lev[0..2].include?(correct)
  top5_lev += 1 if @lev[0..4].include?(correct)

  # Damerau
  time = Benchmark.realtime do
    @dam = SinhalaTransliterator::SpellChecker.suggest_damerau(noisy)
  end

  dam_time += time

  top1_dam += 1 if @dam[0] == correct
  top3_dam += 1 if @dam[0..2].include?(correct)
  top5_dam += 1 if @dam[0..4].include?(correct)

end

puts "\n===== LEVENSHTEIN ====="
puts "Top-1 Accuracy: #{(top1_lev.to_f / total * 100).round(2)}%"
puts "Top-3 Accuracy: #{(top3_lev.to_f / total * 100).round(2)}%"
puts "Top-5 Accuracy: #{(top5_lev.to_f / total * 100).round(2)}%"
puts "Average Time: #{(lev_time / total * 1000).round(3)} ms"

puts "\n===== DAMERAU-LEVENSHTEIN ====="
puts "Top-1 Accuracy: #{(top1_dam.to_f / total * 100).round(2)}%"
puts "Top-3 Accuracy: #{(top3_dam.to_f / total * 100).round(2)}%"
puts "Top-5 Accuracy: #{(top5_dam.to_f / total * 100).round(2)}%"
puts "Average Time: #{(dam_time / total * 1000).round(3)} ms"

puts "\nTotal Test Words: #{total}"