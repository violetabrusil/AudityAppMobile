//
//  ReviewView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/23/22.
//

import SwiftUI

struct ReviewView: View {
    
    @State private var rating: Int?
    
    var body: some View {
        VStack {
            HStack{
                Button(action: {
                       print("Close")
                   }, label: {
                       HStack{
                           Image(systemName: "xmark")
                               .resizable()
                               .frame(width: 15, height: 15)
                               .padding()
                               .foregroundColor(Color.white)
                       }
                   })
            }
            .padding(.leading, 300.0)
            Spacer()
            VStack(spacing: 5){
                Image("aslan")
                    .resizable()
                    .frame(width: 200, height: 250)
                    .padding()
                
                Text("¿Cómo califica este título?")
                    .foregroundColor(Color.white)
                    .font(.system(size: 20, weight: .heavy, design: .default))
                StarsView(rating: $rating)
                Text(rating != nil ? "Calificación: \(rating!)" : "")
            }
            Spacer()
            VStack(spacing: 30){
                TextField("Escriba aqui su comentario", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .frame(width: 370,height:250)
                    .overlay( RoundedRectangle(cornerRadius: 20) .stroke(Color.green) )
                    .multilineTextAlignment(.leading)
                
                Button(action: {
                       print("Enviar")
                   }, label: {
                       HStack{
                           Text("Enviar")
                               .font(.system(size: 15, weight: .heavy, design: .default))
                       }
                       .padding()
                      
                   })
                    .frame(width: 150)
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                    
            }
            .padding(.bottom,30)
        
            
           
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.black))
    }
    
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView()
    }
}
