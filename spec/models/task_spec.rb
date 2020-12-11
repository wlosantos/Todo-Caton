require 'rails_helper'

RSpec.describe Task, type: :model do

  describe "validation" do
    it ':description must be present' do
      description = build(:task, description: '')
      expect(description).to_not be_valid()
      description = build(:task, description: 'Comprar conexões')
      expect(description).to be_valid()
    end
    it ':done must be present' do
      done = build(:task, done: nil)
      expect(done).to_not be_valid()
      done = build(:task)
      expect(done).to be_valid()
    end
  end

end
