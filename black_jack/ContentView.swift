//
//  ContentView.swift
//  black_jack
//
//  Created by Sergey Ufimtsev on 29.03.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var game = GameState()
    @State var updater = false
    @State var showWinAlert = false
    @State var showLooseAlert = false
    var body: some View {
        ZStack{
            Image("background").resizable().ignoresSafeArea()
            VStack{
                HStack{
                    Text("Банк: "+String(self.game.bank)+"$")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.trailing)
                }
                Spacer()
                //Карты диллера
                HStack(){
                    ForEach(game.getCPUCards()){card in
                        Image(card.Name).resizable().aspectRatio(contentMode: .fit)
                    }
                    
                }
                .padding(.horizontal, 20.0)
                .frame(height: 200.0)
                Text("Счет диллера: "+String(self.game.getCPUValue()))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Spacer()
                HStack{
                    Button(action: {
                        if(self.game.getPlayerValue()<=21){
                            self.game.pickPlayerCard()
                            if(self.game.getPlayerValue()>21){
                                showLooseAlert=true
                            }
                        }
                        
                        
                    }, label: {
                        Text("Взять")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .padding(.all, 15.0)
                            .frame(width: 150.0)
                            
                    }).alert(isPresented: $showWinAlert) {
                        Alert(title: Text("Победа"), message: Text("Вы молодец!"), dismissButton: .default(Text("Спасибо")) {
                            game.updateBank(value: +20)
                            game.newGame()
                            updater.toggle()
                            showWinAlert=false
                        })}.border(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
                    .cornerRadius(/*@START_MENU_TOKEN@*/7.0/*@END_MENU_TOKEN@*/)
                    
                    Button(action: {
                        let result = game.cpuTurn()
                        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (timer) in
                            if result == true{
                                showLooseAlert = true
                            }else{
                                showWinAlert = true
                            }
                        }
                        
                    }, label:{
                        Text("Хватит")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)})
                    .padding(.all, 15.0)
                    .frame(width: 150.0)
                    .alert(isPresented: $showLooseAlert) {
                        Alert(title: Text("Поражение"), message: Text("Не расстраивайтесь, выйграете в другой раз"), dismissButton: .default(Text("Обидно(((")) {
                            game.updateBank(value: -20)
                            game.newGame()
                            updater.toggle()
                            showLooseAlert=false
                        })
                    }
                    .border(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
                    .cornerRadius(/*@START_MENU_TOKEN@*/7.0/*@END_MENU_TOKEN@*/)
                }
                
                Spacer()
                Text("Ваш счет: "+String(self.game.getPlayerValue()))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                HStack(){
                    ForEach(game.getPlayerCards()){card in
                        Image(card.Name).resizable().aspectRatio(contentMode: .fit)
                    }
                    
                }
                .padding(.horizontal, 20.0)
                .frame(height: 200.0)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
