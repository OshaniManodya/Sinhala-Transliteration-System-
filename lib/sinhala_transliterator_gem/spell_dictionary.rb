require "csv"

module SinhalaTransliterator
  module SpellDictionary
    WORDS = []

    csv_path = File.expand_path(
      "../../data/sinhala_words.csv",
      __dir__
    )

    puts "Spell CSV Path: #{csv_path}"
    puts "File Exists? #{File.exist?(csv_path)}"

    if File.exist?(csv_path)
      CSV.foreach(csv_path, headers: true) do |row|

        word = row["word"]&.strip

        WORDS << word if word
      end
    end
  end
end