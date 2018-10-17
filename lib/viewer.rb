module Viewer
  class Viewer
    def self.print(human)
      human.state.instance_variables.each do |st|
        p st.to_s[1..-1] + ': ' + human.state.instance_variable_get(st).to_s
      end
    end

    def self.all_actions(list)
      list.each_with_index do |f, i|
        p "[#{i}] " + f.to_s
      end
    end

    def self.ask(list)
      l = list.length
      act = 0
      loop do
        all_actions list
        p 'What do you want?'
        act = gets.chomp.to_i
        p 'You choose ' + list[act].to_s
        list[act]
        break if (act >= 0) && (act < l)

        p 'Incorrect index'
      end
      list[act]
    end
  end
end
