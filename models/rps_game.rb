class RPSGame 
  attr_accessor :play, :computer_play, :created_at

  Plays = [:rock, :paper, :scissors]

  WinMap = {
    rock: :scissors,
    paper: :rock,
    scissors: :paper
  }

  def initialize(play)
    play = play.to_sym if play

    if RPSGame.valid_play?(play)
      self.play = play
      self.computer_play = Plays.sample
    else
      raise PlayTypeError
    end

    @created_at = Time.now
  end

  def self.valid_play?(play)
    Plays.include?(play)
  end

  def won?
    WinMap[play] == computer_play
  end

  def tied?
    play == computer_play
  end

  def lost?
    !won? && !tied?
  end

  def result
    # binding.pry
    RPSGameResult.new(self)
  end

  class PlayTypeError < Exception
  end
end
