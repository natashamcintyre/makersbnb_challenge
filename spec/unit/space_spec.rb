require 'space'

describe Space do
  describe '.create' do
    it 'stores space data in database' do
      space = Space.create(name: "Test Cottage")

      expect(Space.all.first).to eq space
    end
  end
end
