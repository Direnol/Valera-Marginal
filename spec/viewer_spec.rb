require 'model'
require 'viewer'

RSpec.describe Viewer do
  context 'viewer' do
    subject(:viewer) { Viewer::Viewer }
    subject(:valera) { Model::Human.new }
    subject(:state) { valera.state }
    subject(:available_actions) { valera.available_actions.available }
    subject(:actions) do
      [Model::Sleep, Model::SingInTheSubway,
       Model::DrinkWithMarginalPersonalities,
       Model::GoToTheBar,
       Model::DrinkWineAndWatchTVSeries,
       Model::ContemplateNature,
       Model::GoToWork]
    end

    it 'print' do
      expect([:@health, :@mana, :@cheerfulness, :@fatigue, :@money, :@sm]).to eql(viewer.print(valera))
    end
    it 'all actions' do
      valera.available_actions.update_available state
      expect(actions).to eql(viewer.all_actions(available_actions))
    end
  end
end
