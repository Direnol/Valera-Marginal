require 'model'

describe Model do
  context 'when create' do
    subject(:valera) { Model::Human.new }
    subject(:state) { Model::HumanState.new }
    it 'actions' do
      expect(nil).to eql(valera.get_list_of_action)
    end
    it 'state health' do
      expect(100).to eql(state.health)
    end
    it 'state mana' do
      expect(0).to eql(state.mana)
    end
    it 'state cheerfulness' do
      expect(100).to eql(state.cheerfulness)
    end
    it 'state fatigue' do
      expect(0).to eql(state.fatigue)
    end
    it 'state money' do
      expect(20).to eql(state.money)
    end
    it 'state sm' do
      expect(22).to eql(state.sm)
    end
  end
end
