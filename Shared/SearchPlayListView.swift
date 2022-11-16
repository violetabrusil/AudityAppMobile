//
//  SearchPlayListView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/26/22.
//

import SwiftUI

struct SearchPlayListView: View {
    
//    @Binding var showSearchPlayListView: Bool
//
//    public init (showSearchPlayListView:Binding<Bool>){
//
//        self._showSearchPlayListView = showSearchPlayListView
//
//    }
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            HStack(spacing:1){
              
                HStack(spacing:1){
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color("GreenColor"))
                        .padding()
                        
                    TextField("Busca tus librerías", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                }
                .frame(width: 300,height:40)
                .background()
                .cornerRadius(10)
        
                Button(action: {
                    dismiss()
                   }, label: {
                       HStack{
                           Text("Cancelar")
                               .font(.system(size: 15, weight: .heavy, design: .default))
                          
                       }
                       .padding()
                      
                   })
                    .frame(width: 100)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
            }
            .padding(.bottom, 700)
        
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("fullBackground"))
    }
}

struct SearchPlayListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPlayListView()
    }
}
