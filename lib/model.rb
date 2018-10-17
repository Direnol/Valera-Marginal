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
      human_state.cheerfulness += 1
      human_state.mana -= 10
      human_state.fatigue += 10
      human_state
    end

    def self.active?(_human_state)
      true
    end
  end

  class DrinkWineAndWatchTVSeries < Action
    def self.run(human_state)
      human_state.cheerfulness -= 1
      human_state.mana += 30
      human_state.fatigue += 10
      human_state.health -= 5
      human_state.money -= 20
      human_state
    end

    def self.active?(_human_state)
      true
    end
  end

  class GoToTheBar < Action
    def self.run(human_state)
      human_state.cheerfulness += 1
      human_state.mana += 60
      human_state.fatigue += 40
      human_state.health -= 10
      human_state.money -= 100
      human_state
    end

    def self.active?(_human_state)
      true
    end
  end

  class DrinkWithMarginalPersonalities < Action
    def self.run(human_state)
      human_state.cheerfulness += 5
      human_state.mana += 90
      human_state.fatigue += 80
      human_state.health -= 80
      human_state.money -= 150
      human_state
    end

    def self.active?(_human_state)
      true
    end
  end

  class SingInTheSubway < Action
    def self.run(human_state)
      human_state.cheerfulness += 1
      human_state.mana += 10
      human_state.fatigue += 20
      human_state.mana += 10
      human_state.money += 50 if human_state.mana > 50 && human_state.mana < 70
      human_state
    end

    def self.active?(_human_state)
      true
    end
  end

  class Sleep < Action
    def self.run(human_state)
      human_state.health += if human_state.mana < 30
                              90
                            else
                              20
                            end
      human_state.cheerfulness -= 3 if human_state.mana > 70
      human_state.mana -= 50
      human_state.fatigue -= 70
      human_state
    end

    def self.active?(_human_state)
      true
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
    attr_reader :available_actions
    attr_accessor :state

    def initialize
      @state = HumanState.new
      @available_actions = AvailableActions.new
    end
  end

  class Valera < Human
  end
end
