require 'poker'

describe Poker do
    describe "#load_hands" do
        it "loads 'hands.json' file" do
            file = File.read('./hands.json')
            data_hash = JSON.parse(file)
            expect(subject.hands).to eq data_hash
        end
    end
end