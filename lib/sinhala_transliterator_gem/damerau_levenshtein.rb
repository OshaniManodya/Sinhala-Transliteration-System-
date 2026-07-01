module SinhalaTransliterator
  module DamerauLevenshtein
    def self.distance(s1, s2)
      m = s1.length
      n = s2.length

      return m if n == 0
      return n if m == 0

      dp = Array.new(m+1){Array.new(n+1, 0)}

      (0..m).each {|i| dp[i][0] = i }
      
      (0..n).each {|j| dp[0][j] = j }
    
      (1..m).each do |i|
        (1..n).each do |j|
          cost = s1[i - 1] == s2[j - 1] ? 0 : 1
          dp[i][j] = [
            dp[i - 1][j] + 1,    # Deletion
            dp[i][j - 1] + 1,    # Insertion
            dp[i - 1][j - 1] + cost # Substitutions
          ].min

          if i > 1 && j > 1 && s1[i - 1] == s2[j - 2] && s1[i - 2] == s2[j - 1]
            dp[i][j] = [dp[i][j], dp[i - 2][j - 2] + cost].min # Transposition
          end
        end
      end

      dp[m][n]
    end
  end
end