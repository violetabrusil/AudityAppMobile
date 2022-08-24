//
//  MoreInformationView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/23/22.
//

import SwiftUI

struct MoreInformationView: View {
    var body: some View {
        
        VStack(spacing: 50){
            
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
            
    
            VStack(spacing: 5){
                Image("aslan")
                    .resizable()
                    .frame(width: 150, height: 190)
                    .padding()
                
                Text("Nombre Audiolibro")
                    .foregroundColor(Color.white)
                    
                
                Text("Nombre Autor")
                    .foregroundColor(Color.white)
                  
                
                Text("Nombre Genero")
                    .foregroundColor(Color.white)
            }
        
        
            VStack{
               
                Button(action: {
                       print("Añadir a lista de reproducción")
                   }, label: {
                       HStack(spacing:20){
                           Image(systemName: "plus")
                               .resizable()
                               .frame(width: 30, height: 30)
                               
                           Text("Añadir a lista de reproducción")
                               .font(.system(size: 20, weight: .heavy, design: .default))
                       }
                       .padding()
                       
                   })
                    .frame(width: 400)
                    .foregroundColor(Color.white)
                
                Button(action: {
                       print("Reseña")
                   }, label: {
                       HStack(spacing:25){
                           Image(systemName: "star.fill")
                               .resizable()
                               .frame(width: 30, height: 30)
                               
                           Text("Reseña")
                               .font(.system(size: 20, weight: .heavy, design: .default))
                            
                       }
                       .padding()
                       
                   })
                    .padding(.trailing, 220.0)
                    .foregroundColor(Color.white)
            }
            .padding(.bottom, 200)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.black))
    }
}

struct MoreInformationView_Previews: PreviewProvider {
    static var previews: some View {
        MoreInformationView()
    }
}
