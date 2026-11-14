//
//  Lab3App.swift
//
//  Assignment 13
//  Aimee Jin
//  11/14/26
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
