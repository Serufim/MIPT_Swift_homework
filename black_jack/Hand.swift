//
//  Hand.swift
//  black_jack
//
//  Created by Sergey Ufimtsev on 29.03.2021.
//

import Foundation

class Hand{
    private var cards :Array<Card>
    private var value: Int
    init(){
        cards = Array<Card>()
        value = 0
    }
    var getCards: Array<Card>{
        return cards
    }
    func addCard(nextCard: Card){
        cards.append(nextCard)
        value = self.calculateValue()
    }
    func getValue()->Int{
        return value
    }
    func calculateValue()->Int{
        var proxy_cards = cards
        proxy_cards.sort { (carda, cardb) -> Bool in
            carda.Value>cardb.Value
        }
        var result = 0
        for card in proxy_cards {
            if(card.cardType == "Ace") {
                if result+11 > 21{
                    result+=1
                }else{
                    result+=card.Value
                }
            }else{
                result+=card.Value
            }
        }
        return result
    }
}
