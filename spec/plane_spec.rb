require 'plane'

describe Plane do

  let(:airport) {double(:airport,
                name: "JFK",
                planes: [])}

  context '<><> Plane state <><>' do
    it 'returns false if plane is not flying' do
      airport = Airport.new
      subject.land(airport)
      expect(subject.is_flying).to eq false
    end

    it 'returns true if plane is flying' do
      airport = Airport.new
      subject.land(airport)
      subject.take_off(airport)
      expect(subject.is_flying).to eq true
    end
  end

  context '<><> Landing <><>' do
    it 'can land at an airport' do
      airport = Airport.new
      subject.land(airport)
      expect(airport.planes.include?(subject)).to eq true
    end

    it 'prevents second landing' do
      airport = Airport.new
      subject.land(airport)
      expect{subject.land(airport)}.to raise_error "This plane is already landed"
    end
  end

  context '<><> Take off <><>' do
    it 'can take off from an airport' do
      airport = Airport.new
      subject.land(airport)
      expect(subject.take_off(airport)).to eq "Taking off!"
    end

    it 'prevents second take off' do
      airport = Airport.new
      subject.land(airport)
      subject.take_off(airport)
      expect{subject.take_off(airport)}.to raise_error "This plane is already flying"
    end
  end
end
