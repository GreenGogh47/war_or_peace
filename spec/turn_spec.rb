require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Player do
    it "exists" do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)
        card3 = Card.new(:heart, '9', 9)
        card4 = Card.new(:diamond, 'Jack', 11)
        card5 = Card.new(:heart, '8', 8)
        card6 = Card.new(:diamond, 'Queen', 12)
        card7 = Card.new(:heart, '3', 3)
        card8 = Card.new(:diamond, '2', 2)

        deck1 = Deck.new([card1, card2, card5, card8])
        deck2 = Deck.new([card3, card4, card6, card7])

        player1 = Player.new("Megan", deck1)
        player2 = Player.new("Aurora", deck2)

        turn = Turn.new(player1, player2)

        expect(turn).to be_an_instance_of(Turn)
    end

    it "allows players to access their decks" do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)
        card3 = Card.new(:heart, '9', 9)
        card4 = Card.new(:diamond, 'Jack', 11)
        card5 = Card.new(:heart, '8', 8)
        card6 = Card.new(:diamond, 'Queen', 12)
        card7 = Card.new(:heart, '3', 3)
        card8 = Card.new(:diamond, '2', 2)

        deck1 = Deck.new([card1, card2, card5, card8])
        deck2 = Deck.new([card3, card4, card6, card7])

        player1 = Player.new("Megan", deck1)
        player2 = Player.new("Aurora", deck2)

        turn = Turn.new(player1, player2)

        expect(turn.player1.deck).to eq(deck1)
    end

    it "has spoils of war empty by default" do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)
        card3 = Card.new(:heart, '9', 9)
        card4 = Card.new(:diamond, 'Jack', 11)
        card5 = Card.new(:heart, '8', 8)
        card6 = Card.new(:diamond, 'Queen', 12)
        card7 = Card.new(:heart, '3', 3)
        card8 = Card.new(:diamond, '2', 2)

        deck1 = Deck.new([card1, card2, card5, card8])
        deck2 = Deck.new([card3, card4, card6, card7])

        player1 = Player.new("Megan", deck1)
        player2 = Player.new("Aurora", deck2)

        turn = Turn.new(player1, player2)
        expect(turn.spoils_of_war).to eq([])
    end

    it "will correctly select a basic turn" do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)
        card3 = Card.new(:heart, '9', 9)
        card4 = Card.new(:diamond, 'Jack', 11)
        card5 = Card.new(:heart, '8', 8)
        card6 = Card.new(:diamond, 'Queen', 12)
        card7 = Card.new(:heart, '3', 3)
        card8 = Card.new(:diamond, '2', 2)

        deck1 = Deck.new([card1, card2, card5, card8])
        deck2 = Deck.new([card3, card4, card6, card7])

        player1 = Player.new("Megan", deck1)
        player2 = Player.new("Aurora", deck2)

        turn = Turn.new(player1, player2)
        expect(turn.type).to eq(:basic)
    end

    it "will correctly select a winner" do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)
        card3 = Card.new(:heart, '9', 9)
        card4 = Card.new(:diamond, 'Jack', 11)
        card5 = Card.new(:heart, '8', 8)
        card6 = Card.new(:diamond, 'Queen', 12)
        card7 = Card.new(:heart, '3', 3)
        card8 = Card.new(:diamond, '2', 2)

        deck1 = Deck.new([card1, card2, card5, card8])
        deck2 = Deck.new([card3, card4, card6, card7])

        player1 = Player.new("Megan", deck1)
        player2 = Player.new("Aurora", deck2)

        turn = Turn.new(player1, player2)
        expect(turn.winner).to eq(player1)
    end

    it "will pile this turns cards into spoils of war" do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)
        card3 = Card.new(:heart, '9', 9)
        card4 = Card.new(:diamond, 'Jack', 11)
        card5 = Card.new(:heart, '8', 8)
        card6 = Card.new(:diamond, 'Queen', 12)
        card7 = Card.new(:heart, '3', 3)
        card8 = Card.new(:diamond, '2', 2)

        deck1 = Deck.new([card1, card2, card5, card8])
        deck2 = Deck.new([card3, card4, card6, card7])

        player1 = Player.new("Megan", deck1)
        player2 = Player.new("Aurora", deck2)

        turn = Turn.new(player1, player2)
        expect(turn.pile_cards).to eq([card1, card3])
    end
end