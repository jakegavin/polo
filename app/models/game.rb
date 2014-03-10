class Game < ActiveRecord::Base
  belongs_to :tournament
  belongs_to :team

  def ha
    if self.home
      "Home"
    else
      "Away"
    end
  end
end