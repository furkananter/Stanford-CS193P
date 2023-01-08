//
//  ContentView.swift
//  Stanford-CS193P
//
//  Created by Furkan Anter on 1/5/23.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚗","🦊","🔥","🪨","😀","🤣","🫥","🎃","🧖","🍀","🐚","🌷","🌝","🐁","🪺","🌼","🌲","🎄","🐲","🍒","🥯","🥐","🥓"]
    @State var emojiCount = 4
    var body: some View {
        VStack {
            HStack {
                ScrollView{
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]){
                        ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                            CardView(content: emoji)
                                .aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                }
            }.foregroundColor(.red)
            HStack{
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
                
    }
    var add: some View {
        Button{
            if emojiCount < emojis.count{
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle.fill")
                
        }
    }
    var remove: some View {
        Button{
            if emojiCount > 1{
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle.fill")
                
        }
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    var content: String
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        ZStack {
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3).foregroundColor(.red)
                Text(content).font(.largeTitle)
            }else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        
    }
}
