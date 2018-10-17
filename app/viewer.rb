module Viewer
  class Viewer
    def self.print(_state)
      p 'health:'
      p 'mana:'
      p 'stamina:'
      p 'sm: 22'
      p 'cheerfulness:'
      p 'fatigue:'
      p 'money:'
    end

    def self.all_actions(human)
      human.get_list_of_action.each do |func|
        p func.to_s
      end
    end

    def self.ask(_list)
      p 'What do you want?'
      act = gets.chomp.to_i
      p 'You choose ' + act.to_s
    end
  end
end
