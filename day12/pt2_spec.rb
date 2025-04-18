require './day12/pt2'

RSpec.describe 'pt2' do
    describe 'remove_red', :aggregate_failures do
      it 'returns the string without red values' do
        expect(remove_red('[1,{"c":"red","b":2},3]')).to eq('[1,,3]')
        expect(remove_red('{"d":"red","e":[1,2,3,4],"f":5}')).to eq('')
        expect(remove_red('[1,"red",5]')).to eq('[1,"red",5]')
        expect(remove_red('[1,2,3]')).to eq('[1,2,3]')
      end
    end
  end