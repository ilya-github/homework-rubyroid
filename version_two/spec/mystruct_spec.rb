require './mystruct'

RSpec.describe MyStruct do
  let(:data) { { a: 1, b: 2, ab: 'asd' } }
  let(:mystruct) { MyStruct.new(data) }

  context 'reading hash data via method' do
    it 'show key value with existing value' do
      expect(mystruct.a).to eq data[:a]
    end
    it 'show key value with no meaning' do
      expect(mystruct.x).to be_nil
    end
  end

  context 'adding a new key with a value in the hash' do
    it 'key with value was successfully added' do
      mystruct.new_attribute = 50
      value = mystruct.hash[:new_attribute]
      expect(mystruct.new_attribute).to eq value
    end
  end

  context 'method redefinition []' do
    it 'should call a method with the name of the argument' do
      value = mystruct['b']
      expect(mystruct.b).to eq value
    end
  end
end
