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

    def check_hand(hand)
        if straight_flush(hand)
            1
        elsif four_of_a_kind(hand)
            2
        end
    end

    def straight_flush(hand)
        suit = hand[0][:suit]
        sorted_hand = hand.sort_by { |card| card[:value]}
        sorted_hand.length.times do | index |
            if hand[index][:suit] != suit
                return false
            elsif hand[index][:value] != (hand[index - 1][:value] + 1) && index != 0
                hand[index][:value]
                hand[index - 1][:value]
                return false
            end
        end
        return true
    end

    def four_of_a_kind(hand)
        hand.each do | card1 |
            count = 0
            value = card1[:value]
            hand.each do | card2 |
                if card2[:value] == value
                    count += 1
                end
                if count == 4
                    true
                end
            end
        end
    end
end