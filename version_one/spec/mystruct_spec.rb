require './mystruct'

RSpec.describe MyStruct do
  let(:data) { { a: 1, b: 2, ab: 'asd' } }
  let(:mystruct) { MyStruct.new(data) }

  context 'testing of auto-created getters' do
    it 'when the attribute contains a value' do
      expect(mystruct.a).to eq data[:a]
    end
    it 'when the attribute not contains a value' do
      expect(mystruct.x).to be_nil
    end
  end

  context 'testing of auto-created setters' do
    it 'a setter should be created' do
      mystruct.new_attribute = 50
      inst_method = mystruct.instance_variable_get(:"@new_attribute")
      expect(mystruct.new_attribute).to eq inst_method
    end
  end

  context 'method redefinition ["my_method"]' do
    it 'should call a method with the name of the argument' do
      value = mystruct['b']
      expect(mystruct.b).to eq value
    end
  end
end
