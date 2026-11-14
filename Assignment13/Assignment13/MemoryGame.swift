//
//  MemoryGame.swift
//
//  Assignment 13
//  Aimee Jin
//  11/14/26
//

import Foundation

// Model holds the card data and game rules
struct MemoryGame {
    
    private(set) var cards: Array<Card>
    // Remembers the first card flipped this turn, or nil if none
    private(set) var firstCardIndex: Int?
    // Number of pairs matched
    private(set) var matchedPairs: Int = 0
        
    struct Card: Identifiable {
        var content: String
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var id: Int
    }
    
    mutating func chooseCard(_ card: Card) {
        var chosenIndex = 0
        for index in cards.indices {
            if cards[index].id == card.id {
                chosenIndex = index
            }
        }

        if cards[chosenIndex].isFaceUp || cards[chosenIndex].isMatched {
            return
        }

        if let firstIndex = firstCardIndex {
            // On the second card of the turn, check for a match
            if cards[chosenIndex].content == cards[firstIndex].content {
                cards[chosenIndex].isMatched = true
                cards[firstIndex].isMatched = true
                matchedPairs += 1
            }
            firstCardIndex = nil
        } else {
            // On the first card of a new turn, flip all unmatched cards down
            for index in cards.indices {
                if !cards[index].isMatched {
                    cards[index].isFaceUp = false
                }
            }
            firstCardIndex = chosenIndex
        }
        cards[chosenIndex].isFaceUp = true
    }
    
    // True when two unmatched cards are face up
    var hasMismatch: Bool {
        var faceUpCount = 0
        for card in cards {
            if card.isFaceUp && !card.isMatched {
                faceUpCount += 1
            }
        }
        return faceUpCount == 2
    }

    mutating func flipBackMismatch() {
        if !hasMismatch {
            return
        }
        for index in cards.indices {
            if !cards[index].isMatched {
                cards[index].isFaceUp = false
            }
        }
        firstCardIndex = nil
    }
    
    
    init(numberOfPairsOfCards: Int, contentFactory: (Int) -> String) {
        cards = []
        
        for index in 0..<numberOfPairsOfCards {
            let content = contentFactory(index)
            // Even ids for the first card in a pair, odd ids for the second
            cards.append(Card(content: content, id: index * 2))
            cards.append(Card(content: content, id: index * 2 + 1))
        }
        cards.shuffle()
    }
}
