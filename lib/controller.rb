module Controller
  load 'lib/viewer.rb'
  load 'lib/model.rb'

  class Controller
    def initialize
      #   @action = Model::Action
    end

    def save_state(state, path)
        f = File.open path, 'w'
        state.instance_variables.each do |st|
            f.write st.to_s[1..-1] + ' ' + state.instance_variable_get(st).to_s
            f.write '\n'
          end
        f.close unless f.nil?
    end

    def load_state(state, path); end

    def execute(human)
      act = Viewer::Viewer.ask human.available_actions.available
      human.state = act.run human.state
      human.available_actions.update_available human.state
      human
    end

    def run
      valera = Model::Human.new
      valera.available_actions.update_available valera.state
      loop do
        Viewer::Viewer.print valera
        p 'Enter command: quit|q, next|n, command|c, info|i, load|l, save|s'
        command = gets.chomp

        case command
        when 'q', 'exit'
          break
        when 'next', 'n'
          next
        when 'command', 'c'
          valera = execute(valera)
        when 'info', 'i'
          Viewer::Viewer.all_actions valera.available_actions.available
        when 'save', 's'
          save_state valera.state, 'valera_save'
        when 'load', 'l'
          load_state valera.state, 'valera_save'
        end
        p 'Type for continue'
        gets
      end
    end
  end
end
