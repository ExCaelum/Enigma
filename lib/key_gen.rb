require 'pry'
class KeyGenerator
  attr_reader :key, :codewords

  def initialize
    @key
    @codewords = ["clue", "fern", "then", "sign", "gone", "pair", "hair", "ring",
                  "site", "sunk", "coat", "sane", "show", "lend", "prim", "rise",
                  "upon", "find", "gave", "wing", "plan", "high", "note", "into",
                  "tree", "hear", "name", "fate", "view", "wait", "lent", "gain",
                  "body", "wash", "kept", "laid", "does", "left", "door", "less",
                  "sour", "pack", "rife", "bolt", "puts", "torn", "glib", "came",
                  "tiny", "stay", "meal", "thus", "look", "date", "lead", "tell",
                  "care", "text", "army", "grew"]
  end

  def generate
    @key = @codewords.sample
  end
end
