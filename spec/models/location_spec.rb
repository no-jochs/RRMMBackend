require 'rails_helper'

RSpec.describe Location, type: :model do
  xdescribe '#create' do
    it 'raises an error' do
      expect { described_class.create }.to raise_error(NotImplementedError)
    end
  end

  xdescribe '#new' do
    it 'raises an error' do
      expect { described_class.new }.to raise_error(NotImplementedError)
    end
  end
end
