//
//  ContentView.swift
//  Shared
//
//  Created by Violeta on 8/22/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            
//          Image()
            
            TextField("Email", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .background()
                .cornerRadius(10)
                .padding()
                
        
            TextField("Password", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .background()
                .cornerRadius(10)
                .padding()
            
            Button(action: {
                   print("Ingresar")
               }, label: {
                   HStack{
//                       Image()
                       Text("Ingresar")
                           .padding()
                           .background(Color.green)
                           .foregroundColor(Color.white)
                           .cornerRadius(20)
    
                   }
                  
               })
            
            Button(action: {
                   print("Ingresa con Google")
               }, label: {
                   Text("Ingresa con Google")
                       .padding()
                       .background(Color.green)
                       .foregroundColor(Color.white)
                       .cornerRadius(20)
               })
          
            
            TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .padding(8)
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.black))
    
        
        
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
