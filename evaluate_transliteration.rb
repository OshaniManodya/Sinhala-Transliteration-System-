require "csv"
require "benchmark"

require_relative "lib/sinhala_transliterator_gem"

# Metrics

metrics = {
  rule: {
    correct: 0,
    edit_distance: 0,
    char_errors: 0,
    time: 0
  },

  dictionary: {
    correct: 0,
    edit_distance: 0,
    char_errors: 0,
    time: 0
  },

  hybrid: {
    correct: 0,
    edit_distance: 0,
    char_errors: 0,
    time: 0
  }
}

total_words = 0
total_characters = 0

# Read Evaluation Dataset

CSV.foreach(
  "data/evaluation_dataset.csv",
  headers: true
) do |row|

  roman = row["roman"]
  correct = row["sinhala"]

  next if roman.nil? || correct.nil?

  roman = roman.strip
  correct = correct.strip

  total_words += 1
  total_characters += correct.length

  # RULE BASED

  rule_output = ""

  rule_time = Benchmark.realtime do
    rule_output = SinhalaTransliterator.convert(
      roman,
      mode: :rule
    )
  end

  distance =
    SinhalaTransliterator::Levenshtein.distance(
      rule_output,
      correct
    )

  metrics[:rule][:correct] += 1 if rule_output == correct
  metrics[:rule][:edit_distance] += distance
  metrics[:rule][:char_errors] += distance
  metrics[:rule][:time] += rule_time

  # DICTIONARY BASED

  dictionary_output = ""

  dictionary_time = Benchmark.realtime do
    dictionary_output = SinhalaTransliterator.convert(
      roman,
      mode: :dictionary
    )
  end

  distance =
    SinhalaTransliterator::Levenshtein.distance(
      dictionary_output,
      correct
    )

  metrics[:dictionary][:correct] += 1 if dictionary_output == correct
  metrics[:dictionary][:edit_distance] += distance
  metrics[:dictionary][:char_errors] += distance
  metrics[:dictionary][:time] += dictionary_time

  
  # HYBRID


  hybrid_output = ""

  hybrid_time = Benchmark.realtime do
    hybrid_output = SinhalaTransliterator.convert(
      roman,
      mode: :hybrid
    )
  end

  distance =
    SinhalaTransliterator::Levenshtein.distance(
      hybrid_output,
      correct
    )

  metrics[:hybrid][:correct] += 1 if hybrid_output == correct
  metrics[:hybrid][:edit_distance] += distance
  metrics[:hybrid][:char_errors] += distance
  metrics[:hybrid][:time] += hybrid_time

end


# Results

puts
puts "        SINHALA TRANSLITERATION EVALUATION REPORT"
puts

puts "Total Test Words : #{total_words}"
puts

metrics.each do |name, result|

  word_accuracy =
    result[:correct].to_f / total_words * 100

  character_accuracy =
[
  0,
  100 -
  (
    result[:char_errors].to_f /
    total_characters * 100
  )
].max
  average_distance =
    result[:edit_distance].to_f / total_words

  cer =
    result[:char_errors].to_f /
    total_characters

  wer =
    (total_words - result[:correct]).to_f /
    total_words

  average_time =
    result[:time] * 1000 / total_words

  puts "Algorithm : #{name.to_s.capitalize}"
  puts "------------------------------------------------------"
  puts "Word Accuracy       : #{word_accuracy.round(2)}%"
  puts "Character Accuracy  : #{character_accuracy.round(2)}%"
  puts "Average Edit Dist.  : #{average_distance.round(3)}"
  puts "Character Error Rate: #{cer.round(4)}"
  puts "Word Error Rate     : #{wer.round(4)}"
  puts "Average Time        : #{average_time.round(3)} ms"
  puts
end