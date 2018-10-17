module Model
  class HumanState
    attr_accessor :health, :mana, :cheerfulness, :fatigue, :money, :sm

    def initialize
      health = 100
      mana = 0
      cheerfulness = 100
      fatigue = 0
      money = 20
      sm = 22
    end
  end

  class Action
  end

  class Human
    attr_reader :state

    def initialize
      state = HumanState.new
    end

    def get_list_of_action; end
  end

  class Valera < Human
  end
end

human_state = HumanState.new

human_state.health = 100
human_state.mana = 0

valera = Valera.new
