require 'model'
require 'controller'

describe Model do
  context 'before create' do
    subject(:valera) { Model::Human.new }
    subject(:actions) { valera.available_actions }
    subject(:state) { valera.state }

    it 'actions' do
      expect([]).to eql(actions.available)
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

  context 'after init' do
    subject(:valera) { Model::Human.new }
    subject(:actions) { valera.available_actions }
    subject(:state) { valera.state }
    subject(:list_acts) do
      [Model::Sleep,
       Model::SingInTheSubway,
       Model::DrinkWithMarginalPersonalities,
       Model::GoToTheBar,
       Model::DrinkWineAndWatchTVSeries,
       Model::ContemplateNature,
       Model::GoToWork]
    end

    it 'init actions' do
      actions.update_available state
      expect(list_acts).to eql(actions.available)
    end
  end
end
