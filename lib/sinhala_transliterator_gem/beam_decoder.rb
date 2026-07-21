module SinhalaTransliterator

  class BeamDecoder

    Beam = Struct.new(:sentence, :score)

    def initialize(beam_width = 10)
      @beam_width = beam_width
    end

    def decode(candidate_lists)

      beams = [Beam.new([], 0)]

      candidate_lists.each do |candidates|

        new_beams = []

        beams.each do |beam|

          candidates.each do |candidate|

  word = candidate[:word]
  bonus = candidate[:bonus]

  score = beam.score

  unless beam.sentence.empty?

    previous = beam.sentence.last

    score += SinhalaTransliterator::Bigram.score(
      previous,
      word
    )

  end

  # Weighted Beam Search
  score += bonus

  new_beams << Beam.new(
    beam.sentence + [word],
    score
  )

end

        end

        # Keep highest scoring beams
        beams = new_beams.sort_by { |b| -b.score }
        beams = beams.first(@beam_width)

      end

      beams.first

    end

  end

end