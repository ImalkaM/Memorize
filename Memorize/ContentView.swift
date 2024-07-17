//
//  ContentView.swift
//  Memorize
//
//  Created by Imalka Muthukumara on 2023-12-17.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻","😘","😁","😇"]
    var body: some View {
        HStack{
            
            ForEach(emojis.indices,id:\.self){ index in
                CardView(content: emojis[index])
            }
        }
        .padding()
        .foregroundColor(.orange)
    }
}

struct CardView:View {
    @State var isFaceUp = true
    let content:String
    var body: some View {
        ZStack{//trailing closure syntax
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp{
                base
                    .fill(.white)
                base
                    .strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            }else{
                base
                    .fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
