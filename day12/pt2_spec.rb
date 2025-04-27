require './day12/pt2'



RSpec.describe 'pt2' do
    describe 'find_open', :aggregate_failures do
      subject(:result) { find_open(7, haystack) }

      context 'when haystack only has one pair of {}' do
        let(:haystack) { '{: 3, 4, :"red"}' }

        it 'finds the opening parenthesis' do
          expect(result).to eq(0)
        end
      end

      context 'when haystack multiple pair of {}' do
        let(:haystack) { '{: {}, X, 4, :"red"}' }

        it 'returns the string without red values' do
          expect(result).to eq(0)
        end
      end
    end
  end

