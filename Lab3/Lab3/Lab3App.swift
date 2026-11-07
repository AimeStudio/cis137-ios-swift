//
//  Lab3App.swift
//
//  Lab3
//  Aimee Jin
//  11/6/26
//

import SwiftUI

@main
struct Lab3App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: EmojiMemoryGame())
        }
    }
}
