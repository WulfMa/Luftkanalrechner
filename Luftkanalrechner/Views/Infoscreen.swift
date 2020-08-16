//
//  SwiftUIView.swift
//  Luftkanalrechner
//
//  Created by Martin Wulf on 15.08.20.
//  Copyright © 2020 Martin Wulf. All rights reserved.
//

import SwiftUI




struct InfoScreen: View {
    
    var body: some View {
        
        ZStack{
            
            VStack (alignment: .center){
                
                HStack {
                    
                    VStack{
                        Spacer()
                            .frame(height: 20)
                        Text("Wilkommen")
                            .font(.title)
                        Text("beim Kanalrechner")
                            .font(.subheadline)
                        Spacer()
                            .frame(height: 20)
                        Image("Blank")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                  
                    }

                }
                
               
            }
            
            
        }
        
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        InfoScreen()
    }
}
