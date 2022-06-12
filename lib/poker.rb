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
        elsif num_of_a_kind(hand, 4)
            2
        elsif full_house(hand)
            3
        elsif flush(hand)
            4
        end
    end

    def straight_flush(hand)
        
        sorted_hand = sort_hand(hand)
        unless flush(sorted_hand)
            return false
        end
        sorted_hand.length.times do | index |
            if sorted_hand[index][:value] != (sorted_hand[index - 1][:value] + 1) && index != 0
                sorted_hand[index][:value]
                sorted_hand[index - 1][:value]
                return false
            end
        end
        return true
    end

    def num_of_a_kind(hand, num, value = nil)
        hand.each do | card |
            if value == nil
                value = card[:value]
            end
            if hand.count { |cards| cards[:value] == value} == num
                return true
            end
        end
        false
    end

    def full_house(hand)
        sorted_hand = sort_hand(hand)
        if num_of_a_kind(sorted_hand, 3, sorted_hand.first[:value]) && num_of_a_kind(sorted_hand, 2, sorted_hand.last[:value])
            return true
        elsif num_of_a_kind(sorted_hand, 2, sorted_hand.last[:value]) && num_of_a_kind(sorted_hand, 3, sorted_hand.last[:value])
            return true
        else 
            return false
        end
    end

    def flush(hand)
        hand.count { | card | card[:suit] == hand.first[:suit] }
    end

    private
    def sort_hand(hand)
        hand.sort_by { |card| card[:value]}
    end
end