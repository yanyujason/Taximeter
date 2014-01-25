require 'taximeter'

describe Taximeter do

  describe 'taxi price' do

    context 'kilometer < 2' do
      it 'should get 6 when the kilometer is 1.2 and waiting time is 0.5 min with round' do
        taximeter = Taximeter.new(0.5, 0)
        expect(taximeter.calculate_price).to eq 6
      end
    end

    context 'kilometer >= 2 && < 8' do
      it 'should get 7 when the kilometer is 2 and waiting time with round' do
        taximeter = Taximeter.new(2, 1)
        expect(taximeter.calculate_price).to eq 7
      end

      it 'should get 8 when the kilometer is 4.2 but no waiting time with round' do
        taximeter = Taximeter.new(4.2, 0)
        expect(taximeter.calculate_price).to eq 8
      end
    end

    context 'kilometer >= 8' do
      it 'should get 14 when the kilometer is 9.2 but no waiting time with round' do
        taximeter = Taximeter.new(9.2, 0)
        expect(taximeter.calculate_price).to eq 14
      end

      it 'should get 14 when the kilometer is 8 and waiting time is 2 min with round' do
        taximeter = Taximeter.new(8, 2)
        expect(taximeter.calculate_price).to eq 14
      end
    end

  end

end
