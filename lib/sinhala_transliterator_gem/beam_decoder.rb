module SinhalaTransliterator

  class BeamDecoder

    Beam = Struct.new(:sentence, :score)

    def initialize(beam_width = 3)
      @beam_width = beam_width
    end

  def decode(candidate_lists)

  beams = [Beam.new([], 0)]

  candidate_lists.each do |candidates|

    new_beams = []

    beams.each do |beam|

      candidates.each do |candidate|

        score = beam.score

        if beam.sentence.empty?
          puts "First word: #{candidate}"
        else

          previous = beam.sentence.last

          bigram_score =
            SinhalaTransliterator::Bigram.score(
              previous,
              candidate
            )

          puts
          puts "#{previous} -> #{candidate}"
          puts "Bigram Score = #{bigram_score}"

          score += bigram_score

        end

        new_beams << Beam.new(
          beam.sentence + [candidate],
          score
        )

      end

    end

    puts
    puts "========== AFTER THIS STEP =========="

    new_beams.each do |b|
      puts "#{b.sentence.join(' ')}   Score=#{b.score}"
    end

    beams = new_beams.sort_by { |b| -b.score }

    beams = beams.first(@beam_width)

  end

  puts
  puts "========== FINAL =========="
  beams.each do |b|
    puts "#{b.sentence.join(' ')}   #{b.score}"
  end

  beams.first.sentence

end

  end

end