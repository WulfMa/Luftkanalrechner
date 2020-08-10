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
                              onCommit : { self.BerechungVG()} )
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 100, height: 50)
                    //.keyboardType(.numberPad) currently not working
                    TextField("", text: $GeschwindigkeitEingabe,
                              onCommit: {self.BerechungVG()})
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 100, height: 50)
                    //.keyboardType(.numberPad) currently not working
                    TextField("", text: $KanalAEingabe,
                              onCommit: { self.BerechungVGA()})
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 100, height: 50)
                    //.keyboardType(.numberPad) currently not working
                    TextField("1000", text: $KanalBEingabe,
                    onCommit: { self.BerechungVAB()})
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 100, height: 50)
                    //.keyboardType(.numberPad) currently not working
                    TextField("1000", text: $KanalDErgebnis)
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
        .frame(height: 100
            )
            
            Image("KanalWhite")
            .resizable()
                .frame(width: 150, height: 150)
            Text("Luftkanarechner v1.0.2")
    }

    
}
func BerechungVGA(){
    var calculation : Double {
        guard let V = Double(VolumenstromEingabe), let g = Double(GeschwindigkeitEingabe), let A = Double(KanalAEingabe) else { return 0 }
        let product = V / g / A * 10000 / 36
        return product
    }
    let formatted = String(format: "%.2f", calculation)
    KanalBEingabe = String(formatted)
   
    var calculation2 : Double {
        guard let V = Double(VolumenstromEingabe), let g = Double(GeschwindigkeitEingabe) else { return 0 }
        let product2 = (V / g / 3600) / 3.14159265
        let product3 = sqrt(product2) * 2000
        return product3
    }
    let formatted2 = String(format: "%.2f", calculation2)
    KanalDErgebnis = String(formatted2)
    
}
    func BerechungVG(){
        var calculation : Double {
            guard let V = Double(VolumenstromEingabe), let g = Double(GeschwindigkeitEingabe) else { return 0 }
            let product = V / g / 3600
            let product2 = sqrt(product) * 1000
            return product2
        }
        let formatted = String(format: "%.2f", calculation)
        KanalBEingabe = String(formatted)
        KanalAEingabe = String(formatted)

       
        var calculation2 : Double {
            guard let V = Double(VolumenstromEingabe), let g = Double(GeschwindigkeitEingabe) else { return 0 }
            let product2 = (V / g / 3600) / 3.14159265
            let product3 = sqrt(product2) * 2000
            return product3
        }
        let formatted2 = String(format: "%.2f", calculation2)
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
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
