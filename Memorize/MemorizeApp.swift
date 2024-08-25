//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Imalka Muthukumara on 2023-12-17.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
