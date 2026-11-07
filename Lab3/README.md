# Lab 3: Memory Game

#### About

An iOS memory card game built with SwiftUI using the MVVM architecture. The game deals 12 shuffled cards with 6 pairs of animal emojis, face down. Tapping a card flips it over with a 3D flip animation. When two cards match, they stay face up. If they don’t match, they flip back when the next card is tapped.

#### Demo

[Add screenshot here]

#### Video Presentation

[Video link coming soon]

#### Three Core Layers

- **Model (**`MemoryGame.swift`**)** holds the card data and game rules. It builds the pairs, shuffles the deck, flips cards, and checks for matches.
- **ViewModel (**`EmojiMemoryGame.swift`**)** connects the model to the view. It picks the emojis, gives the view the list of cards, and passes taps to the model.
- **View (**`ContentView.swift`**)** draws the card grid and sends taps to the view model. It redraws automatically when the model changes.

#### Two Animations

- An explicit animation and `rotation3DEffect` around the vertical axis to flip the card.
- A delayed animation so the emoji is not revealed before the card turns over.
