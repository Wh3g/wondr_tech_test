require 'json'

class Poker
    attr_reader :hands
    def initialize
        @hands = load_hands
    end

    def load_hands
        file = File.read('./hands.json')
        data_hash = JSON.parse(file)
    end
end