//
//  ContentView.swift
//
//  Assignment 13
//  Aimee Jin
//  11/14/26
//

import SwiftUI

// View draws the cards and sends taps to the view model
struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                Text("Memory Game")
                    .font(.largeTitle)
                    .foregroundStyle(.black)
                    .bold()
                
                // Progress bar
                ProgressView("\(Int(viewModel.matchedPairs)) / \(Int(viewModel.totalPairs)) pairs matched", value: viewModel.matchedPairs, total: viewModel.totalPairs)
                    .padding(.horizontal)
                    .tint(.indigo)
                    
                
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(viewModel.cards) { card in
                        EmojiCard(card: card)
                            .aspectRatio(1/1.3, contentMode: .fit)
                            .onTapGesture {
                                // Explicit animation that flips the card with a small bounce
                                withAnimation(.spring(duration: 0.5, bounce: 0.2)) {
                                    viewModel.choose(card)
                                }
                            }
                    }
                }
                .padding(.horizontal)

            }
        }
    }
}

struct EmojiCard: View {
    var card: MemoryGame.Card

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 8)

            shape
                .stroke(lineWidth: 3)
                .foregroundStyle(.indigo)
            Text(card.content)
                .font(.system(size: 64))
                .padding()

            shape.fill(.indigo)
                .opacity(card.isFaceUp ? 0 : 1)
                // Delay hiding the cover so emoji is not revealed before the card turns
                .animation(.linear(duration: 0.01).delay(0.2), value: card.isFaceUp)
        }
        // Rotate the card on the Y axis to flip it
        .rotation3DEffect(.degrees(card.isFaceUp ? 0 : 180), axis: (x: 0, y: 1, z: 0))
    }
}

#Preview {
    ContentView(viewModel: EmojiMemoryGame())
}
