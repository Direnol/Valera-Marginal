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
      ObjectSpace.each_object(Class).select { |child| (child < self) }
    end

    def self.active?(_human_state)
      true
    end

    def self.run(human_state)
      human_state
    end
  end

  class GoToWork < Action
    def self.active?(human_state)
      (human_state.mana < 50) && (human_state.fatigue < 10)
    end

    def self.run(human_state)
      human_state.fatigue += 70
      human_state.money += 100
      human_state.mana -= 30
      human_state.cheerfulness -= 5
      human_state
    end
  end

  class ContemplateNature < Action
    def self.run(human_state)
      human_state
    end

    def self.active?(human_state)
      (human_state.mana < 50) && (human_state.fatigue < 10)
    end
  end

  class AvailableActions
    attr_reader :available
    def initialize
      @actions = Action.descendants
      @available = []
    end

    def update_available(human_state)
      @actions.each do |element|
        available.push(element) if element.active? human_state
      end
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
  valera.available_actions.update_available valera.state
  p valera.available_actions.available[1].run valera.state
end
