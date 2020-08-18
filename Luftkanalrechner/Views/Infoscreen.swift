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
                
                VStack (alignment: .center, spacing: 5){
                    
                    Text("Wilkommen")
                        .font(.title)
                        .padding(.top)
                    Text("beim Kanalrechner")
                        .font(.subheadline)
                        .padding(.bottom)
                }
                
                
            }
            VStack{
                
                Image("Blank")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 350)
            }
            Button(action: {self.showingInfoSheet2 = true}) {
                Text("Weiter")
                Image(systemName: "wind")
                .padding()
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
                        .padding(.trailing)
                }
                
            }
            VStack{
                
                Image("VundG")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 350)
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
    @State private var showingInfoSheet4 = false
    
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
                        .padding(.trailing)
                }
                
                
            }
            VStack{
                
                Image("KanalA")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 350)
            }
            Button(action: {self.showingInfoSheet4 = true}) {
                Text("Weiter")
                Image(systemName: "wind")
            }
            .sheet(isPresented: $showingInfoSheet4, content: {
                InfoScreen4()
            })
                .padding()
        }
    }
}

struct InfoScreen4: View {
    @State private var showingInfoSheet4 = false
    
    var body: some View {
        NavigationView{
        VStack{
            
            HStack (alignment: .center){
                
                VStack (alignment: .leading, spacing: 5){
                    
                    Text("Einführung")
                        .font(.title)
                        .padding(.top)
                        .padding(.leading)
                    Text("Eine Eingabe im Feld Kanal B verändert die Geschwindigkeit bei gleich bleibendem Kanal A und Volumenstrom ")
                        .font(.subheadline)
                        .padding(.bottom)
                        .padding(.leading)
                        .padding(.trailing)
                }

                
            }
            VStack{
                
                Image("KanalAundB")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 350)
            }
            NavigationLink(destination: ContentView()) {
                Text("Fertig")
                .padding()
            }

        }
        }
    }
}
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        InfoScreen4()
    }
}
