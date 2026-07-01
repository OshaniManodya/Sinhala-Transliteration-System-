module SinhalaTransliterator
  module Rules

    # Independent vowels
    INDEPENDENT_VOWELS = {
      "aa" => "ආ",
      "Aa" => "ඈ",
      "ii" => "ඊ",
      "uu" => "ඌ",
      "Ru" => "ඎ",
      "ee" => "ඒ",
      "ai" => "ඓ",
      "oo" => "ඕ",
      "au" => "ඖ",

      "a" => "අ",
      "A" => "ඇ",
      "i" => "ඉ",
      "u" => "උ",
      "R" => "ඍ",
      "e" => "එ",
      "o" => "ඔ"
    }

    # Base consonants
    CONSONANTS = {
      "zdha" => "ඳ",
      "thh"  => "ථ",
      "dhh"  => "ධ",
      "chh"  => "ඡ",

      "zga"  => "ඟ",
      "zja"  => "ඦ",
      "zda"  => "ඬ",
      "zka"  => "ඤ",
      "zha"  => "ඥ",

      "kh"   => "ඛ",
      "gh"   => "ඝ",
      "ch"   => "ච",
      "th"   => "ත",
      "dh"   => "ද",
      "ph"   => "ඵ",
      "bh"   => "භ",
      "sh"   => "ශ",
      "Sh"   => "ෂ",

      "J"    => "ඣ",
      "T"    => "ඨ",
      "D"    => "ඪ",
      "N"    => "ණ",
      "B"    => "ඹ",

      "k"    => "ක",
      "g"    => "ග",
      "j"    => "ජ",
      "t"    => "ට",
      "d"    => "ඩ",
      "n"    => "න",
      "p"    => "ප",
      "b"    => "බ",
      "m"    => "ම",
      "y"    => "ය",
      "r"    => "ර",
      "l"    => "ල",
      "w"    => "ව",
      "s"    => "ස",
      "h"    => "හ",
      "f"    => "ෆ"
    }

    # Dependent vowel signs (for consonants)
    VOWEL_SIGNS = {
      "aa" => "ා",
      "A"  => "ැ",
      "Aa" => "ෑ",
      "i"  => "ි",
      "ii" => "ී",
      "u"  => "ු",
      "uu" => "ූ",
      "ru" => "ෘ",
      "ruu"=> "ෲ",
      "e"  => "ෙ",
      "ee" => "ේ",
      "ai" => "ෛ",
      "o"  => "ො",
      "oo" => "ෝ",
      "au" => "ෞ",

      # inherent vowel
      "a"  => ""
    }

    # Special signs
    SPECIAL_SIGNS = {
      "H" => "ඃ",
      "x" => "ං",
      "X" => "ඞ"
    }

    # Hal kirima (virama)
    HAL = "්"

    # Conjuncts
    CONJUNCTS = {
      "ya" => "්‍ය",
      "Ya" => "්ය",
      "ra" => "්‍ර",
      "Ra" => "්ර"
    }

    # Token matching order
    # Longest patterns first
    TOKENS = (
      CONJUNCTS.keys +
      SPECIAL_SIGNS.keys +
      VOWEL_SIGNS.keys +
      CONSONANTS.keys +
      INDEPENDENT_VOWELS.keys
    ).sort_by { |t| -t.length }

  end
end