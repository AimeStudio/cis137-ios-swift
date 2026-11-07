//
//  MemoryGame.swift
//
//  Lab3
//  Aimee Jin
//  11/6/26
//

import Foundation


struct MemoryGame {
    
    private(set) var cards: Array<Card>
    private(set) var numberOfPairs: Int
    private(set) var firstCardIndex: Int?
        
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
            if cards[chosenIndex].content == cards[firstIndex].content {
                cards[chosenIndex].isMatched = true
                cards[firstIndex].isMatched = true
            }
            firstCardIndex = nil
        } else {
            for index in cards.indices {
                if !cards[index].isMatched {
                    cards[index].isFaceUp = false
                }
            }
            firstCardIndex = chosenIndex
        }
        cards[chosenIndex].isFaceUp = true
    }
    
    
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
        numberOfPairs = numberOfPairsOfCards
        
        for index in 0..<numberOfPairsOfCards {
            let content = contentFactory(index)
            cards.append(Card(content: content, id: index * 2))
            cards.append(Card(content: content, id: index * 2 + 1))
        }
        cards.shuffle()
    }
}
