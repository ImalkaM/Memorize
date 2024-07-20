//
//  ContentView.swift
//  Memorize
//
//  Created by Imalka Muthukumara on 2023-12-17.
//

import SwiftUI

struct Emoji: Identifiable {
    let id = UUID()
    let symbol: String
}

enum Theme:String, CaseIterable, Identifiable {
    case animals = "Animals"
    case travel = "Travel"
    case nature = "Nature"
    case food = "Food"
    
    var id: String { self.rawValue }
    
    var emojis:[String]{
        switch self {
        case .food:
            return ["🍕", "🍔", "🍣", "🍎", "🍫", "🍩", "🍉", "🍪", "🍌", "🥑"]
        case .animals:
            return ["🐶", "🐱", "🐼", "🐨", "🐯", "🦊", "🐸", "🦁", "🐰", "🦄"]
        case .travel:
            return ["✈️", "🗺️", "🚀", "🚗", "🏖️", "🌍", "🏕️", "🚢", "🗽", "🏔️"]
        case .nature:
            return ["🌳", "🌸", "🌞", "🌧️", "🌈", "🌼", "🍂", "🌲", "🍁", "🍃"]
        }
    }
    
    var iconName: String {
        switch self {
        case .food:
            return "leaf"
        case .animals:
            return "hare"
        case .travel:
            return "airplane"
        case .nature:
            return "tree"
        }
    }
    
    var themeColor:Color{
        switch self {
        case .food:
            return .cyan
        case .animals:
            return .pink
        case .travel:
            return .purple
        case .nature:
            return .gray
        }
    }
    
    func randomEmojiPairs() -> [Emoji] {
        let baseEmojis = self.emojis
        let numberOfPairs = Int.random(in: 2...baseEmojis.count)
        let selectedEmojis = Array(baseEmojis.prefix(numberOfPairs))
        var duplicatedEmojis = selectedEmojis + selectedEmojis
        return duplicatedEmojis.map { Emoji(symbol: $0) }.shuffled()
    }
}

struct ContentView: View {
    
    @State private var selectedTheme:Theme = .animals
    
    @State var cardCount = 4
    
    var body: some View {
        VStack{
            Text("Memorize")
            Text("\(selectedTheme.randomEmojiPairs().count)")
                .font(.largeTitle)
            ScrollView{
                cards
            }
            Spacer()
            ThemeButtons
        }
        .padding()
    }
    
    var cards:some View{
        LazyVGrid(columns:[GridItem(.adaptive(minimum: 120))]){
            
            ForEach(selectedTheme.randomEmojiPairs()){ emoji in
                CardView(content: emoji.symbol)
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(selectedTheme.themeColor)
    }
    
    var ThemeButtons: some View{
        HStack{
            emojiThemeButton
        }
        .imageScale(.small)
        .font(.title)
       
    }
    
    var emojiThemeButton: some View{
        ForEach(Theme.allCases) { theme in
            Button(action: {
                selectedTheme = theme
            }) {
                VStack {
                    Image(systemName: theme.iconName)
                      
                    Text(theme.rawValue)
                        .font(.body)
                }
                .cornerRadius(10)
                .padding(2)
            }
            .frame(maxWidth: .infinity)
            .aspectRatio(1, contentMode: .fit)
        }
    }
}

struct CardView:View {
    @State var isFaceUp = false
    let content:String
    var body: some View {
        ZStack{//trailing closure syntax
            let base = RoundedRectangle(cornerRadius: 12)
            
            Group{
                base
                    .fill(.white)
                base
                    .strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            }
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
