//
//  SearchView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/24/22.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        VStack{
            
            VStack{
                
                Text("Buscar")
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.white)
                    .font(.system(size: 25, weight: .heavy, design: .default))
                
                HStack(spacing:1){
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding()
                        
                    TextField("Autores o títulos", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                }
                .frame(width: 370,height:40)
                .background()
                .cornerRadius(10)
                
            }
            
            VStack{
                
                Text("Géneros")
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 5)
                    .foregroundColor(Color.white)
                    .font(.system(size: 20, weight: .heavy, design: .default))
                
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.black))
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
