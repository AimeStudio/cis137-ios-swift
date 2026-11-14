# Assignment 13: Memory Game + ProgressView

### About

An iOS memory card game built with SwiftUI using the MVVM architecture. The game deals 12 shuffled cards with 6 pairs of animal emojis, face down. Tapping a card flips it over with a 3D flip animation. When two cards match, they stay face up. If they don’t match, they flip back after a short delay.

This assignment extends Lab 3 by adding a progress bar at the top that shows how close the player is to finishing the game. 

### Demo

https://github.com/user-attachments/assets/4f47ee82-aff7-427b-b508-42939ff18278

### The Progress Bar

- Model (MemoryGame.swift) keeps track of progress with a new variable (matchedPairs). It starts at 0 and goes up by 1 each time two cards match.
- ViewModel (EmojiMemoryGame.swift) gives the view access to that value through two accessors. matchedPairs passes along the model's count, and totalPairs calculates the number of pairs from the cards.
- View (ContentView.swift) displays the progress bar, filling it based on the matched pairs and total pairs from the view model.

---

View more in [Lab 3](https://github.com/AimeStudio/cis137-ios-swift/tree/main/Lab3)
