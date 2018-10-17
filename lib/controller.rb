module Controller
  load 'lib/viewer.rb'
  load 'lib/model.rb'

  class Controller
    def initialize
      @action = Model::Action
    end

    def save_state(path); end

    def load_state(path); end

    def execute(command)
      method = Kernel.const_get ('@' + @action.to_s + command.to_s)
    end

    def run
      loop do
        command = gets.chomp
        valera = Model::Model.new
        break if (command == 'exit') || (command == 'q')

        Viewer::Viewer.print valera.to_s
        act = Viewer::Viewer.ask
      end
    end
  end
end
