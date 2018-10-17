require 'controller'

describe Controller do
  context 'config' do
    subject(:controller) { Controller::Controller.new }
    subject(:valera) { Model::Human.new }
    subject(:actions) { valera.available_actions }
    subject(:state) { valera.state }

    it 'save' do
        controller.save_state state, 'test_save'
        new_s = controller.load_state state, 'test_save'
        expect(state).to eql(new_s)
    end
  end
end
