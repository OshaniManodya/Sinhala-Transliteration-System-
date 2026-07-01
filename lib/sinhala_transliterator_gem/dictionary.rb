require "csv"

module SinhalaTransliterator
  module Dictionary
    WORDS = {}

    csv_path = File.expand_path(
      "../../data/dictionary.csv",
      __dir__
    )

    if File.exist?(csv_path)
      CSV.foreach(csv_path, headers: true) do |row|
        roman = row["roman"]&.downcase&.strip
        sinhala = row["sinhala"]&.strip

        if roman && sinhala
          WORDS[roman] = sinhala
        end
      end
    end
  end
end