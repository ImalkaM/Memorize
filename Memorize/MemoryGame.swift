//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Imalka Muthukumara on 2024-07-25.
//

import Foundation


struct MemorizeGame<CardContent>{
    var cards:Array<Card>
    
    func choose(card:Card){
        
    }
    
    struct Card{
        var isFaceUp:Bool
        var isMatched:Bool
        var content:CardContent
    }
}
