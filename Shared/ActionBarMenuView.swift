//
//  ActionBarMenuView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/22/22.
//

import SwiftUI

struct ActionBarMenuView: View {
    var body: some View {
    
        VStack {
            Spacer()
            HStack(alignment: .bottom){
                VStack(spacing:-10.0){
                    Button(action: {
                           print("Home")
                       }, label: {
                           HStack{
                               Image(systemName: "house.fill")
                                   .resizable()
                                   .frame(width: 30, height: 30)
                                   .padding()
                                   .foregroundColor(Color.white)
                           }
                       })
                    Text("Inicio")
                        .foregroundColor(Color.white)
                        .font(.system(size: 13))
                    
                }
                .padding(.bottom, 8)
                
                VStack(spacing:-10.0){
                    Button(action: {
                           print("Search")
                       }, label: {
                           HStack{
                               Image(systemName: "magnifyingglass")
                                   .resizable()
                                   .frame(width: 30, height: 30)
                                   .padding()
                                   .foregroundColor(Color.white)
                           }
                       })
                    Text("Buscar")
                        .foregroundColor(Color.white)
                        .font(.system(size: 13))
                    
                }
                .padding(.bottom, 8)
                .padding(.horizontal, 60)
                
                VStack(spacing:-10.0){
                    Button(action: {
                           print("Library")
                       }, label: {
                           HStack{
                               Image(systemName: "books.vertical.fill")
                                   .resizable()
                                   .frame(width: 30, height: 30)
                                   .padding()
                                   .foregroundColor(Color.white)
                           }
                       })
                    Text("Mi Biblioteca")
                        .foregroundColor(Color.white)
                        .font(.system(size: 13))
                    
                }
                .padding(.bottom, 8)
                
            }
            .frame(maxWidth: 414, maxHeight: 60)
        .background(Color.black)
        }
        
            
    }
}

struct ActionBarMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ActionBarMenuView()
    }
}
