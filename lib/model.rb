module Model
  class HumanState
    attr_accessor :health, :mana, :cheerfulness, :fatigue, :money, :sm

    def initialize
      @health = 100
      @mana = 0
      @cheerfulness = 100
      @fatigue = 0
      @money = 20
      @sm = 22
    end
  end

  class Action
    def self.descendants
      ObjectSpace.each_object(Class).select { |child| child < self }
    end
    def run(human_state)
      human_state
    end
  end

  class GoToWork < Action
    def run(human_state)
      human_state
    end
  end

  class AvailableActions
    attr_accessor :actions
    def initialize
      @actions
    end
  end

  class Human
    attr_reader :state, :available_actions

    def initialize
      @state = HumanState.new
      @available_actions = AvailableActions.new
    end
  end

  class Valera < Human

  end
  valera = Valera.new
  p valera.state.health.to_s
end

