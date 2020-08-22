//
//  ScrollView.swift
//  Luftkanalrechner
//
//  Created by Martin Wulf on 22.08.20.
//  Copyright © 2020 Martin Wulf. All rights reserved.
//

import SwiftUI

struct ScrollView1: View {
    var body: some View {
        ScrollView {
            
            VStack (spacing: 80){
                
                VStack{
                    
                    VStack (alignment: .center, spacing: 5){
                        
                        Text("Wilkommen")
                            .font(.title)
                            .padding(.top)
                            .fixedSize(horizontal: true, vertical: true)
                            .lineLimit(1)
                        Text("beim Kanalrechner")
                            .font(.subheadline)
                            .padding(.bottom)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    
                    Image("Blank")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                        .padding()
                }
                
                VStack{
                    
                    VStack (alignment: .leading, spacing: 5){
                        
                        
                        Text("Zur Berechung eines Kanals Volumenstrom und Geschwindigkeit eingeben")
                            .font(.subheadline)
                            .padding()
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(2)
                    }
                    
                    Image("VundG")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                        .padding()
                }
                
                VStack{
                    
                    VStack (alignment: .leading, spacing: 5){
                        
                        
                        Text("Eine Eingabe im Feld Kanal A verändert Kanal B bei gleichbleibendem Volumenstrom und Geschwindigkeit")
                            .font(.subheadline)
                            .padding(.bottom)
                            .padding(.leading)
                            .padding(.trailing)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(3)
                        
                        
                    }
                    Image("KanalA")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                        .padding()
                    
                }
                
                VStack{
                    VStack (alignment: .leading, spacing: 5){
                        
                        
                        Text("Eine Eingabe im Feld Kanal B verändert die Geschwindigkeit bei gleich bleibendem Kanal A und Volumenstrom ")
                            .font(.subheadline)
                            .padding(.bottom)
                            .padding(.leading)
                            .padding(.trailing)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(3)
                    }
                    Image("KanalAundB")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                        .padding()
                }
                VStack{
                    ZStack{
                        
                   Text("Besonderer Dank an Celine für das Design des App-Icons und Michael für die Entwicklungsunterstützung <3")
                    .font(.subheadline)
                    .padding()
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(3)
                    .border(Color.gray, width: 5)

                        
                    }
                    
                }
            
                
                
                
                
            }
            
            
            
        }
    }
}
struct ScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView1()
    }
}
