require 'rails_helper'
require 'support/shared_examples_for_venues'

RSpec.describe VirtualVenue, type: :model do
  include_examples 'core venue requirements'

  describe '.instance' do
    before(:each) do
      expect(described_class).to receive(:find_or_create_by!).exactly(1).time
      expect(described_class).to receive(:instance).at_least(:once)
    end

    it 'does not call finder methods repeatedly' do
      5.times { described_class.instance }
    end
  end

  describe '.instance' do
    subject(:record) { described_class.instance }

    it 'is an instance of VirtualVenue' do
      expect(record).to be_instance_of(described_class)
    end
  end
end
