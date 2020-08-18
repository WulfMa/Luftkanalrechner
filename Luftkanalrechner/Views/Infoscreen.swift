//
//  SwiftUIView.swift
//  Luftkanalrechner
//
//  Created by Martin Wulf on 15.08.20.
//  Copyright © 2020 Martin Wulf. All rights reserved.
//

import SwiftUI

struct InfoScreen: View {
    @State private var showingInfoSheet2 = false
    
    var body: some View {
        
        VStack{
            
            HStack (alignment: .center){
                
                VStack (alignment: .leading){
                    
                    Text("Wilkommen")
                        .font(.title)
                    Text("beim Kanalrechner")
                        .font(.subheadline)
                }
                
                
            }
            VStack{
                
                Image("Blank")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Button(action: {self.showingInfoSheet2 = true}) {
                Text("Weiter")
                Image(systemName: "wind")
            }
            .sheet(isPresented: $showingInfoSheet2, content: {
                InfoScreen2()
            })
        }
    }
}
struct InfoScreen2: View {
    @State private var showingInfoSheet3 = false
    
    var body: some View {
        
        VStack{
            
            HStack (alignment: .center){
                
                VStack (alignment: .leading, spacing: 5){
                    
                    
                    Text("Einführung")
                        .font(.title)
                        .padding(.top)
                        .padding(.leading)
                    Text("Zur Berechung eines Kanals Volumenstrom und Geschwindigkeit eingeben")
                        .font(.subheadline)
                        .padding(.bottom)
                        .padding(.leading)
                }
                
            }
            VStack{
                
                Image("VundG")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Button(action: {self.showingInfoSheet3 = true}) {
                Text("Weiter")
                Image(systemName: "wind")
            }
            .sheet(isPresented: $showingInfoSheet3, content: {
                InfoScreen3()
            })
                .padding()
        }
    }
}

struct InfoScreen3: View {
    @State private var showingInfoSheet3 = false
    
    var body: some View {
        
        VStack{
            
            HStack (alignment: .center){
                
                VStack (alignment: .leading, spacing: 5){
                    
                    Text("Einführung")
                        .font(.title)
                        .padding(.top)
                        .padding(.leading)
                    Text("Eine Eingabe im Feld Kanal A verändert Kanal B bei gleichbleibendem Volumenstrom und Geschwindigkeit")
                        .font(.subheadline)
                        .padding(.bottom)
                        .padding(.leading)
                }
                
                
            }
            VStack{
                
                Image("Blank")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Button(action: {self.showingInfoSheet3 = true}) {
                Text("Weiter")
                Image(systemName: "wind")
            }
            .sheet(isPresented: $showingInfoSheet3, content: {
                InfoScreen3()
            })
                .padding()
        }
    }
}
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        InfoScreen3()
    }
}
