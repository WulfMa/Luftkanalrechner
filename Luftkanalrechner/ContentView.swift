//
//  ContentView.swift
//  Luftkanalrechner
//
//  Created by Martin Wulf on 22.07.20.
//  Copyright © 2020 Martin Wulf. All rights reserved.
//

// some Superscript ¹ ² ³ ⁴ ⁵ ⁶ ⁷ ⁸ ⁹

import SwiftUI
import UIKit

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
//this is making the keybord go away when i call the function hidekeyboard()

struct ContentView: View {
    
    @State private var VolumenstromEingabe: String = ""
    @State private var GeschwindigkeitEingabe: String = ""
    @State private var KanalAEingabe: String = ""
    @State private var VolumenstromErgebnis: String = ""
    @State private var GeschwindigkeitErgebnis: String = ""
    @State private var KanalAErgebnis : String = ""
    @State private var KanalBEingabe : String = ""
    @State private var KanalDErgebnis : String = ""
    @State private var KanalDEingabe : String = ""
    @State private var showingInfoSheet = false
    
    
    var body: some View {

        VStack{
            Spacer()
            HStack (alignment: .top){
                
                VStack (alignment: .trailing, spacing:8){
                    
                    Text("Volumenstrom")
                        .font(.body)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .frame(height: 50)
                    Text("Geschwindigkeit")
                        .font(.body)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .frame(height: 50)
                    Text("Kanalmaß A")
                        .font(.body)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .frame(height: 50)
                    Text("Kanalmaß B")
                        .font(.body)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .frame(height: 50)
                    Text("Durchmesser D")
                        .font(.body)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .frame(height: 50)
                    
                }
                
                VStack (alignment: .center){
                    
                    TextField("0", text: $VolumenstromEingabe,
                              onCommit : { self.BerechungVG()} )
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 100, height: 50)
                    //.keyboardType(.numberPad) currently not working
                    TextField("0", text: $GeschwindigkeitEingabe,
                              onCommit: {self.BerechungVG()})
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 100, height: 50)
                    //.keyboardType(.numberPad) currently not working
                    TextField("0", text: $KanalAEingabe,
                              onCommit: { self.BerechungVGA()})
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 100, height: 50)
                    //.keyboardType(.numberPad) currently not working
                    TextField("0", text: $KanalBEingabe,
                              onCommit: { self.BerechungVAB()})
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 100, height: 50)
                    //.keyboardType(.numberPad) currently not working
                    TextField("0", text: $KanalDErgebnis,
                              onCommit: { self.BerechungDg()})
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 100, height: 50)
                    //.keyboardType(.numberPad) currently not working
                    
                }
                
                VStack (alignment: .leading, spacing: 8){
                    
                    Text("in m³/h")
                        .font(.body)
                        .fontWeight(.bold)
                        .frame(height: 50)
                    Text("in m/s")
                        .font(.body)
                        .fontWeight(.bold)
                        .frame(height: 50)
                    Text("in mm")
                        .font(.body)
                        .fontWeight(.bold)
                        .frame(height: 50)
                    Text("in mm")
                        .font(.body)
                        .fontWeight(.bold)
                        .frame(height: 50)
                    Text("in mm")
                        .font(.body)
                        .fontWeight(.bold)
                        .frame(height: 50)
                }
            }
            Spacer()

            
            HStack{

                VStack{
                    Spacer()
                    Image(systemName: "wind")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 80)
                        .padding()
                
                    Button(action: {
                       self.showingInfoSheet.toggle()
                    }) {
                       Text("Infomationen")
                        
                    }
                    .sheet(isPresented: $showingInfoSheet, content: {
                        ScrollView1()
                    })

                Text("Luftkanalrechner v1.0.2")
                    .padding()
            }
            }
        }
    }
    func BerechungVGA(){
        var calculation : Double {
            guard let V = Double(VolumenstromEingabe), let g = Double(GeschwindigkeitEingabe), let A = Double(KanalAEingabe) else { return 0 }
            let product = V / g / A * 10000 / 36
            let rounded = Double(round(product/100)*100)
            return rounded
        }
        let formatted = String(format: "%.0f", calculation)
        KanalBEingabe = String(formatted)
        
        var calculation2 : Double {
            guard let V = Double(VolumenstromEingabe), let g = Double(GeschwindigkeitEingabe) else { return 0 }
            let product2 = (V / g / 3600) / 3.14159265
            let product3 = sqrt(product2) * 2000
            return product3
            
        }
        let formatted2 = String(format: "%.0f", calculation2)
        KanalDErgebnis = String(formatted2)
        
    }
    func BerechungVG(){
        var calculation : Double {
            guard let V = Double(VolumenstromEingabe), let g = Double(GeschwindigkeitEingabe) else { return 0 }
            let product = V / g / 3600
            let product2 = sqrt(product) * 1000
            return product2
        }
        let formatted = String(format: "%.0f", calculation)
        KanalBEingabe = String(formatted)
        KanalAEingabe = String(formatted)
        
        
        var calculation2 : Double {
            guard let V = Double(VolumenstromEingabe), let g = Double(GeschwindigkeitEingabe) else { return 0 }
            let product2 = (V / g / 3600) / 3.14159265
            let product3 = sqrt(product2) * 2000
            return product3
        }
        let formatted2 = String(format: "%.0f", calculation2)
        KanalDErgebnis = String(formatted2)
        
    }
    func BerechungVAB(){
        var calculation : Double {
            guard let V = Double(VolumenstromEingabe), let B = Double(KanalBEingabe), let A = Double(KanalAEingabe) else { return 0 }
            let product = V / B / A * 10000 / 36
            return product
        }
        let formatted = String(format: "%.2f", calculation)
        GeschwindigkeitEingabe = String(formatted)
    }
    func BerechungDg(){
        var calculation : Double {
            guard let D = Double(KanalDErgebnis), let V = Double(VolumenstromEingabe) else { return 0 }
            let product3 = D / 1000
            let product2 = (product3 / 2) * (product3 / 2)
            let product1 = V / 3600 / 3.14159265 / product2
            return product1
        }
        let formatted = String(format: "%.2f", calculation)
        GeschwindigkeitEingabe = String(formatted)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
