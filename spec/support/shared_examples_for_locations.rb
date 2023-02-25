RSpec.shared_examples 'location examples' do
  subject(:location) { build(described_class.to_s.underscore.to_sym) }

  describe "it's name" do
    it 'cannot be empty' do
      location.name = nil
      expect(location).to_not be_valid
    end

    it 'cannot be trivial' do
      location.name = 'a'
      expect(location).to_not be_valid
    end

    it 'cannot be longer than 255 characters' do
      location.name = 'a' * 256
      expect(location).to_not be_valid
    end
  end

  describe "it's notes" do
    it 'can be empty' do
      location.notes = nil
      expect(location).to be_valid
    end

    it 'can contain more than 255 characters' do
      location.notes = ('a'..'z').cycle.take(1000).join('')
      expect(location.save).to be_truthy
    end
  end

  describe "it's slug" do
    it 'cannot be empty' do
      location.slug = nil
      expect(location).to_not be_valid
    end

    it 'validates with SlugValidator' do
      expect_any_instance_of(SlugValidator).to receive(:validate).with(location)
      location.valid?
    end
  end

  describe "it's status" do
    it 'cannot be empty' do
      location.status = nil
      expect(location).to_not be_valid
    end

    it "cannot be something other than #{Location.statuses.keys}" do
      expect { location.status = (described_class.statuses.keys.sample + 'lol') }.to raise_error(ArgumentError)
    end
  end
end
