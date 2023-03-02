RSpec.shared_examples 'core venue requirements' do
  subject(:venue) { build(described_class.to_s.underscore.to_sym) }

  describe '#name' do
    it 'cannot be empty' do
      venue.name = nil
      expect(venue).to_not be_valid
    end

    it 'cannot be trivial' do
      venue.name = 'a'
      expect(venue).to_not be_valid
    end

    it 'cannot be longer than 255 characters' do
      venue.name = 'a' * 256
      expect(venue).to_not be_valid
    end

    it 'must be unique' do
      v1 = create(:venue)
      v2 = build(:venue, name: v1.name)
      expect(v2).to_not be_valid
    end
  end

  describe '#slug' do
    it 'is validated by the SlugValidator' do
      expect_any_instance_of(SlugValidator).to receive(:validate).with(venue)
      venue.valid?
    end

    it 'must be unique' do
      v1 = create(:venue)
      v2 = build(:venue, slug: v1.slug)
      expect(v2).to_not be_valid
    end
  end

  describe '#meetings' do
    it 'returns a collection' do
      expect(venue.meetings).to be_instance_of(ActiveRecord::Associations::CollectionProxy)
    end
  end

  describe '#type' do
    it 'cannot be blank' do
      venue.type = nil
      expect(venue).to_not be_valid
    end

    %w[PhysicalVenue InPersonVenue HybridVenue].each do |value|
      it "is valid with #{value}" do
        venue.type = value
        expect(venue).to be_valid
      end
    end

    %w[foo bar baz].each do |value|
      it "is invalid with arbitrary value #{value}" do
        venue.type = value
        expect(venue).to_not be_valid
      end
    end
  end

  describe '#status=' do
    it "only accepts one of #{Venue.statuses.keys}" do
      Venue.statuses.keys.each do |s|
        expect { venue.status = (s + Time.current.to_i.to_s[-3..-1]) }.to raise_error(ArgumentError)
      end
    end
  end
end
