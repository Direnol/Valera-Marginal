module Model
  class HumanState
    attr_accessor :health, :mana, :cheerfulness, :fatigue, :money
  end

  class Action

  end

  class Human
    attr_reader :state

    def init
      state = HumanState.new
    end

    def get_list_of_action

    end

  end

  class Valera < Human

  end
end

human_state = HumanState.new

human_state.health = 100
human_state.mana = 0

valera = Valera.new

