//
//  CreateNewPlayListView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/24/22.
//

import SwiftUI

struct CreateNewPlayListView: View {
    var body: some View {
        VStack{
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
            VStack{
                Text("Escriba un nombre para la lista")
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.white)
                    .font(.system(size: 25, weight: .heavy, design: .default))
                    .padding(.top, 80)
                
                TextField("Escriba aqui su comentario", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .frame(width: 380,height:50)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.white)
                    .padding(.top, 20)
                
                Button(action: {
                       print("Crear")
                   }, label: {
                       HStack{
                           Text("Crear")
                               .font(.system(size: 20, weight: .heavy, design: .default))
                       }
                       .padding()
                      
                   })
                    .frame(width: 150)
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(50)
                    .padding(.top, 30)
                
            }
            .padding(.bottom,200)
            Spacer()
            
        }
        .frame(width: .infinity, height: .infinity)
        .background(
            Image("background")
        )
    }
}

struct CreateNewPlayListView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewPlayListView()
    }
}
