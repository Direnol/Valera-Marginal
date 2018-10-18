module Controller
  load 'lib/viewer.rb'
  load 'lib/model.rb'

  class Controller
    def initialize
      @action = Model::Action
    end

    def save_state(state, path)
      f = File.open path, 'w'
      state.instance_variables.each do |st|
        f.puts st.to_s[1..-1] + ' ' + state.instance_variable_get(st).to_s
      end
      f.close unless f.nil?
    end

    def load_state(state, path)
      f = File.open path, 'r'
      state.instance_variables.each do |_st|
        key, val = f.gets.chomp.split ' '
        state.instance_variable_set(('@' + key), val.to_i)
      end
      f.close unless f.nil?
      state
     end

    def dead?(h_s)
      h_s.state.health < -100
    end

    def execute(human)
      act = Viewer::Viewer.ask human.available_actions.available
      human.state = act.run human.state
      human
    end

    def run
      valera = Model::Human.new
      loop do
        valera.available_actions.update_available valera.state
        Viewer::Viewer.print valera
        p 'Enter command: quit|q, next|n, command|c,' \
          'info|i, load|l, save|s, pwd|p'
        command = gets.chomp

        case command
        when 'pwd', 'p'
          p Dir.pwd
        when 'q', 'exit'
          break
        when 'next', 'n'
          next
        when 'command', 'c'
          valera = execute(valera)
          if dead? valera
            p 'Valera dead!!!'
            exit 0
          end
        when 'info', 'i'
          Viewer::Viewer.all_actions valera.available_actions.available
        when 'save', 's'
          p 'Enter path to file'
          path = gets.chomp
          save_state valera.state, path
        when 'load', 'l'
          p 'Enter path to file'
          path = gets.chomp
          valera.state = load_state valera.state, path
        end
        p 'Type for continue'; gets
      end
    end
  end
end
