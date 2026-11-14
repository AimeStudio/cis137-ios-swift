//
//  EmojiMemoryGame.swift
//
//  Assignment 13
//  Aimee Jin
//  11/14/26
//

import SwiftUI
import Combine

// ViewModel connects the model to the view
class EmojiMemoryGame: ObservableObject {
    
    // Published makes the view redraw when the model changes
    @Published private var model: MemoryGame = createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame {
        return MemoryGame(numberOfPairsOfCards: 6, contentFactory: makeContent)
    }
    
    static func makeContent(index: Int) -> String {
        let emojis = ["🐵", "🦊", "🐼", "🦁", "🐷", "🐰"]
        return emojis[index]
    }
    
    var cards: [MemoryGame.Card] {
        model.cards
    }
    
    // Accessor for the number of matched pairs
    var matchedPairs: Double {
        Double(model.matchedPairs)
    }
    
    // Total number of card pairs
    var totalPairs: Double {
        Double(model.cards.count / 2)
    }
    
    // Intent the view calls when the user taps a card
    func choose(_ card: MemoryGame.Card) {
        model.chooseCard(card)
        
        // If the cards don't match, wait 0.8 seconds and flip them back
        if model.hasMismatch {
            Task {
                try? await Task.sleep(for: .seconds(0.8))
                withAnimation(.spring(duration: 0.5, bounce: 0.2)) {
                    model.flipBackMismatch()
                }
            }
        }
    }
}

