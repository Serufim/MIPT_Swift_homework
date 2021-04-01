//
//  GameState.swift
//  black_jack
//
//  Created by Sergey Ufimtsev on 30.03.2021.
//

import Foundation

class GameState: ObservableObject{
    @Published private(set) var deck:Deck = Deck()
    @Published private(set) var playerHand = Array<Card>()
    @Published private(set) var cpuHand = Array<Card>()
    @Published private(set) var bank: Int = 1000
    
    init(){
        self.fillDefaultHand()
    }
    func fillDefaultHand(){
        playerHand.append(deck.getCard())
        playerHand.append(deck.getCard())
        
        cpuHand.append(deck.getCard())
    }
    func getPlayerCards()->Array<Card>{
        return playerHand
    }
    func getPlayerCardsCount()->Int{
        return playerHand.count
    }
    func getBank()->Int{
        return bank
    }
    func updateBank(value:Int){
        bank+=value
    }
    func newGame() {
        deck.shuffle()
        playerHand.removeAll()
        cpuHand.removeAll()
        self.fillDefaultHand()
    }
    
    func getPlayerValue()-> Int{
        var proxy_cards = playerHand
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
    
    func getCPUValue()-> Int{
        var proxy_cards = cpuHand
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
    
    func pickPlayerCard(){
        playerHand.append(deck.getCard())
    }
    
    
    func pickCPUCard(){
        cpuHand.append(deck.getCard())
    }
    func getCPUCards()->Array<Card>{
        return cpuHand
    }
    func getCPUCardsCount()->Int{
        return cpuHand.count
    }
    func playerTurn(){}
    
    func cpuTurn()->Bool{
        while getCPUValue() <= getPlayerValue() {
            cpuHand.append(deck.getCard())
        }
        if getCPUValue()>21{
            return false
        }
        if getCPUValue() >= getPlayerValue(){
            return true
        }
        return true
    }
}
