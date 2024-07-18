//
//  ContentView.swift
//  Memorize
//
//  Created by Imalka Muthukumara on 2023-12-17.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻","😘","😁","😇","👻","😘","😁","😇","👻","😘","😁","😇"]
    @State var cardCount = 4
    
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    func cardCountAdjuster(by offset:Int,symbol:String) -> some View{
        Button(action: {
            cardCount += offset
            
        }, label: {
            Image(systemName:symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cards:some View{
        
        LazyVGrid(columns:[GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<cardCount,id:\.self){ index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAdjusters: some View{
        HStack{
            cardAdder
            Spacer()
            cardRemover
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    var cardAdder: some View{
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.fill.badge.plus")
    }
    
    var cardRemover: some View{
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
}

struct CardView:View {
    @State var isFaceUp = true
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
