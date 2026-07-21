require "csv"
require_relative "lib/sinhala_transliterator_gem"

# ----------------------------------------------------
# Train Bigram Language Model
# ----------------------------------------------------
SinhalaTransliterator::Bigram.train(
  "data/sentence_corpus.txt"
)

decoder = SinhalaTransliterator::BeamDecoder.new

correct = 0
wrong = 0
total = 0

total_score = 0.0
total_time = 0.0

errors = []

puts "========================================"
puts "Beam Search Evaluation"
puts "========================================"
puts

CSV.foreach("data/beam_test.csv", headers: true) do |row|

  roman = row["roman"]
  expected = row["expected"]

  words = roman.split

  candidate_lists = words.map do |word|
    SinhalaTransliterator::CandidateGenerator.generate(word)
  end

  puts "Candidate Lists:"
  p candidate_lists

  # ---------------------------------------
  # Measure decoding time
  # ---------------------------------------
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  beam = decoder.decode(candidate_lists)

  end_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  elapsed = (end_time - start_time) * 1000.0

  predicted = beam.sentence.join(" ")

  total_time += elapsed
  total_score += beam.score

  puts "------------------------------------------"
  puts "Roman     : #{roman}"
  puts "Expected  : #{expected}"
  puts "Predicted : #{predicted}"
  puts format("Score      : %.4f", beam.score)
  puts format("Time       : %.3f ms", elapsed)

  if predicted == expected

    puts "✓ Correct"

    correct += 1

  else

    puts "✗ Wrong"

    wrong += 1

    errors << {
      roman: roman,
      expected: expected,
      predicted: predicted,
      score: beam.score
    }

  end

  total += 1

  puts

end

# ----------------------------------------------------
# Final Results
# ----------------------------------------------------

puts "========================================"
puts "FINAL RESULT"
puts "========================================"

puts "Correct Sentences : #{correct}"
puts "Wrong Sentences   : #{wrong}"
puts "Total Sentences   : #{total}"

accuracy = (correct.to_f / total) * 100

puts format("Sentence Accuracy : %.2f%%", accuracy)

average_score = total_score / total
average_time = total_time / total

puts format("Average Beam Score : %.4f", average_score)
puts format("Average Decode Time: %.3f ms", average_time)

# ----------------------------------------------------
# Error Analysis
# ----------------------------------------------------

puts
puts "========================================"
puts "ERROR ANALYSIS"
puts "========================================"

if errors.empty?

  puts "No errors found."

else

  errors.each_with_index do |e, index|

    puts
    puts "Error #{index + 1}"
    puts "Roman     : #{e[:roman]}"
    puts "Expected  : #{e[:expected]}"
    puts "Predicted : #{e[:predicted]}"
    puts format("Score     : %.4f", e[:score])

  end

end