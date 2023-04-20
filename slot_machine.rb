# Let’s implement a SlotMachine class with 3 reels. Each reel has 5 different items.

# SlotMachine.new             => ready to play slot machine
# SlotMachine.new(%w[🍒 7️⃣ 🛎]) => already played slot machine

# The class has one public instance method, score, following these rules:

# Item	      Three of the same	  Two of the same + Joker
# Joker   🤩	50	                25 (2 jokers + anything)
# Star    ⭐️	40	                20
# Bell    🛎	30	                15
# Seven   7️⃣	 20	                 10
# Cherry  🍒	10	                5

# Optional
# The class has one public instance method, play udpate and return random combi of reels.
class SlotMachine

  SYMBOLS = %w[🍒 7️⃣ 🛎 ⭐️ 🤩]

  def initialize(combo = [])
    @combo = combo
  end

  def score
    # if we get 3 same symbols [🤩🤩🤩]
    if @combo.uniq.size == 1
      # return the score based on index + 1 * 10
      return (SYMBOLS.index(@combo.first) + 1) * 10
      # if we have two + joker [⭐️ ⭐️ 🤩] [🤩 🤩 🍒]
    elsif @combo.uniq.size == 2 && @combo.include?('🤩')
    # return the score based on index + 1 * 5
    return (SYMBOLS.index(@combo.sort[1]) + 1) * 5
    # if they are all different
    else
      return 0
    end
  end

  def play
    @combo = []
    60.times do
      @combo = []
      3.times do
        @combo << SYMBOLS.sample
      end
      print "|\t" + @combo.join("\t|\t") + "\t|\r"
      # $stdout.flush
      sleep(0.03)
    end
    puts "-" * 49
    print "|\t" + @combo.join("\t|\t") + "\t|\r"
    puts "\n" + "-" * 49
    return @combo
  end
end