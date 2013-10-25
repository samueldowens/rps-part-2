require_relative '../config/environment'

class RPSGameResult < Sequel::Model(:games)
  attr_accessor :game, :human_play, :computer_play, :won

  def initialize(object)
    @game = object
  end

  def won
    if @game.won? == true 
      true
    else
      false
    end
  end

  def won?
    if @game[:won] == true
      true
    else
      false
    end
  end

  def created_at
    @game.created_at
  end

  def tied?
    if @game[:tied]
      true
    else
      false
    end
  end

  def human_play
    @game.play.to_s
  end

  def computer_play
    @game.computer_play.to_s
  end

  def exists?
    # ds = DB[:rps_game]
    # variable = ds.where(:id=> @game[:id])
    # if variable != nil
    #    true
    # else 
      false
    # end
  end

end