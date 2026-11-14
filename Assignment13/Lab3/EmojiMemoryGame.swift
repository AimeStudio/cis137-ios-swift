//
//  EmojiMemoryGame.swift
//
//  Lab3
//  Aimee Jin
//  11/6/26
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

