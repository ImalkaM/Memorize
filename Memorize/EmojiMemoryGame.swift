//
//  EmojiMemoryGameVM.swift
//  Memorize
//
//  Created by Imalka Muthukumara on 2024-07-25.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👻", "🎃", "🦇","🧛","⚰️","🪄","🔮","🧿","🦄","🍭","🧙","🧌"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: 32) { pairIndex in
            if emojis.indices.contains(pairIndex){
                emojis[pairIndex]
            } else {
                "⁉️"
            }
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
