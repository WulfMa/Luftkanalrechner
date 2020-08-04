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
    @State private var KanalBErgebnis : String = ""
    @State private var KanalDErgebnis : String = ""
    
    
    var body: some View {
        
        VStack{
            
            HStack{
                
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
                    
                    TextField("", text: $VolumenstromEingabe,
                              onCommit : { self.BerechungVundG()} )
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 100, height: 50)
                        .keyboardType(.numberPad)
                    TextField("", text: $GeschwindigkeitEingabe)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 100, height: 50)
                        .keyboardType(.numberPad)
                    TextField("", text: $KanalAEingabe)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 100, height: 50)
                        .keyboardType(.numberPad)
                    TextField("1000", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 100, height: 50)
                        .keyboardType(.numberPad)
                    TextField("1000", text: $KanalDErgebnis)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 100, height: 50)
                        .keyboardType(.numberPad)
                    
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
            Button(action: {self.BerechungVundG()}) {
                Text("Berechnen")
            }
            Spacer()
                .frame(height: 50)
            
            
            
            HStack{
                
                
                VStack(alignment: .leading, spacing: 5){
                    
                    Text("Volumenstrom =  \(VolumenstromErgebnis) m³/h")
                    Text("Geschwindigkeit =  \(GeschwindigkeitErgebnis) m/s")
                    Text("Kanal A =  \(KanalAErgebnis) mm")
                    Text("Kanal B =  \(KanalBErgebnis) mm")
                    Text("Rochdurchmesser D =  \(KanalDErgebnis) mm")
                    
                    
                }
                
            }
            
            
        }
        
        
        
        
    }
    func BerechungVundG(){
        self.hideKeyboard()
        var calculation : Double {
            guard let V = Double(VolumenstromEingabe), let g = Double(GeschwindigkeitEingabe), let A = Double(KanalAEingabe) else { return 0 }
            let product = V / g / A * 10000 / 36
            return product
        }
        let formatted = String(format: "%.2f", calculation)
        KanalBErgebnis = String(formatted)
        var calculation2 : Double {
            guard let V = Double(VolumenstromEingabe), let g = Double(GeschwindigkeitEingabe) else { return 0 }
            let product2 = (V / g / 3600) / 3.14159265
            let product3 = sqrt(product2) * 2000
            return product3
        }
        let formatted2 = String(format: "%.2f", calculation2)
        KanalDErgebnis = String(formatted2)
        
        
        KanalAErgebnis = KanalAEingabe
        GeschwindigkeitErgebnis = GeschwindigkeitEingabe
        VolumenstromErgebnis = VolumenstromEingabe
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
