require 'poker'

describe Poker do
    before do
        @example_hands = [
            {"suit": "heart", "value": 1}, {"suit": "heart", "value": 13}, {"suit": "heart", "value": 12}, {"suit": "heart", "value": 11}, {"suit": "heart", "value": 10}
        ]
    end
    describe "#load_hands" do
        it "loads 'hands.json' file" do
            file = File.read('./hands.json')
            data_hash = JSON.parse(file)
            expect(subject.hands).to eq data_hash
        end
    end

    describe "#check_hand" do
        it "checks straight flushes" do
            expect(subject.check_hand(@example_hands[0])).to eq 1
        end
    end
end