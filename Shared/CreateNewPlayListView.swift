//
//  CreateNewPlayListView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/24/22.
//

import SwiftUI

struct CreateNewPlayListView: View {
    
    @Binding var showCreateNewPlayListView: Bool
    
    public init (showCreateNewPlayListView:Binding<Bool>){
        
        self._showCreateNewPlayListView = showCreateNewPlayListView
        
    }
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    showCreateNewPlayListView.toggle()
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
                
                TextField("Nombre lista", text: .constant("Nombre de la lista"))
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
        CreateNewPlayListView(showCreateNewPlayListView: .constant(true))
    }
}
