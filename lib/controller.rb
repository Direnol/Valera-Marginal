module Controller
  load 'lib/viewer.rb'
  load 'lib/model.rb'

  class Controller
    def save_state(path); end

    def load_state(path); end

    def execute(command); end


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
