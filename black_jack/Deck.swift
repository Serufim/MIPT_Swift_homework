//
//  Deck.swift
//  black_jack
//
//  Created by Sergey Ufimtsev on 29.03.2021.
//

import Foundation

class Deck {
    private var cards: Array<Card>
    private var currItem: Int
    init() {
        cards = Array<Card>()
        self.currItem = 0
        cards.append(Card(Name: "Clovers_2_white", Value: 2, cardType: "simple", id:1))
        cards.append(Card(Name: "Clovers_3_white", Value: 3, cardType: "simple", id:2))
        cards.append(Card(Name: "Clovers_4_white", Value: 4, cardType: "simple", id:3))
        cards.append(Card(Name: "Clovers_5_white", Value: 5, cardType: "simple", id:4))
        cards.append(Card(Name: "Clovers_7_white", Value: 7, cardType: "simple", id:6))
        cards.append(Card(Name: "Clovers_8_white", Value: 8, cardType: "simple", id:7))
        cards.append(Card(Name: "Clovers_9_white", Value: 9, cardType: "simple", id:8))
        cards.append(Card(Name: "Clovers_10_white", Value: 10, cardType: "simple", id:9))
        cards.append(Card(Name: "Clovers_Jack_white", Value: 10, cardType: "simple", id:10))
        cards.append(Card(Name: "Clovers_King_white", Value: 10, cardType: "simple", id:11))
        cards.append(Card(Name: "Clovers_Queen_white", Value: 10, cardType: "simple", id:12))
        cards.append(Card(Name: "Clovers_A_white", Value: 10, cardType: "Ace", id:13))
        
        cards.append(Card(Name: "Hearts_2_white", Value: 2, cardType: "simple", id:14))
        cards.append(Card(Name: "Hearts_3_white", Value: 3, cardType: "simple", id:15))
        cards.append(Card(Name: "Hearts_4_white", Value: 4, cardType: "simple", id:16))
        cards.append(Card(Name: "Hearts_5_white", Value: 5, cardType: "simple", id:17))
        cards.append(Card(Name: "Hearts_7_white", Value: 7, cardType: "simple", id:19))
        cards.append(Card(Name: "Hearts_8_white", Value: 8, cardType: "simple", id:20))
        cards.append(Card(Name: "Hearts_9_white", Value: 9, cardType: "simple", id:21))
        cards.append(Card(Name: "Hearts_10_white", Value: 10, cardType: "simple", id:22))
        cards.append(Card(Name: "Hearts_Jack_white", Value: 10, cardType: "simple", id:23))
        cards.append(Card(Name: "Hearts_King_white", Value: 10, cardType: "simple", id:24))
        cards.append(Card(Name: "Hearts_Queen_white", Value: 10, cardType: "simple", id:25))
        cards.append(Card(Name: "Hearts_A_white", Value: 11, cardType: "Ace", id:26))
        
        cards.append(Card(Name: "Pikes_2_white", Value: 2, cardType: "simple", id:27))
        cards.append(Card(Name: "Pikes_3_white", Value: 3, cardType: "simple", id:28))
        cards.append(Card(Name: "Pikes_4_white", Value: 4, cardType: "simple", id:29))
        cards.append(Card(Name: "Pikes_5_white", Value: 5, cardType: "simple", id:30))
        cards.append(Card(Name: "Pikes_7_white", Value: 7, cardType: "simple", id:32))
        cards.append(Card(Name: "Pikes_8_white", Value: 8, cardType: "simple", id:33))
        cards.append(Card(Name: "Pikes_9_white", Value: 9, cardType: "simple", id:34))
        cards.append(Card(Name: "Pikes_10_white", Value: 10, cardType: "simple", id:35))
        cards.append(Card(Name: "Pikes_Jack_white", Value: 10, cardType: "simple", id:36))
        cards.append(Card(Name: "Pikes_King_white", Value: 10, cardType: "simple", id:37))
        cards.append(Card(Name: "Pikes_Queen_white", Value: 10, cardType: "simple", id:38))
        cards.append(Card(Name: "Pikes_A_white", Value: 11, cardType: "Ace", id:39))
        
        cards.append(Card(Name: "Tiles_2_white", Value: 2, cardType: "simple", id:40))
        cards.append(Card(Name: "Tiles_3_white", Value: 3, cardType: "simple", id:41))
        cards.append(Card(Name: "Tiles_4_white", Value: 4, cardType: "simple", id:42))
        cards.append(Card(Name: "Tiles_5_white", Value: 5, cardType: "simple", id:43))
        cards.append(Card(Name: "Tiles_6_white", Value: 6, cardType: "simple", id:44))
        cards.append(Card(Name: "Tiles_7_white", Value: 7, cardType: "simple", id:45))
        cards.append(Card(Name: "Tiles_8_white", Value: 8, cardType: "simple", id:46))
        cards.append(Card(Name: "Tiles_9_white", Value: 9, cardType: "simple", id:47))
        cards.append(Card(Name: "Tiles_10_white", Value: 10, cardType: "simple", id:48))
        cards.append(Card(Name: "Tiles_Jack_white", Value: 10, cardType: "simple", id:49))
        cards.append(Card(Name: "Tiles_King_white", Value: 10, cardType: "simple", id:50))
        cards.append(Card(Name: "Tiles_Queen_white", Value: 10, cardType: "simple", id:51))
        cards.append(Card(Name: "Tiles_A_white", Value: 11, cardType: "Ace", id:52))
        cards.shuffle()
    }
    
    func shuffle(){
        cards.shuffle()
        self.currItem = 0
    }
    
    func getCard() -> Card{
        self.currItem += 1
        return cards[currItem - 1]
    }
}
