//
//  AddToPlayListView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/24/22.
//

import SwiftUI

struct AddToPlayListView: View {
    
    @State private var showNewPlayList = false
    @Environment(\.dismiss) var dismiss
    let audioBook: AudioBook
    
    
    public init(audioBook: AudioBook) {
        self.audioBook = audioBook
    }
    
    var body: some View {
        
        VStack(spacing: 10){
            HStack(spacing: 5){
                Button(action: {
                    dismiss()
                   }, label: {
                       HStack{
                           Image(systemName: "arrow.left")
                               .resizable()
                               .frame(width: 20, height: 20)
                               .padding()
                               .foregroundColor(Color.white)
                       }
                   })
                    .padding(.trailing, 20.0)
                
                Text("Añadir a la Lista de Reproducción")
                    .frame(width: 300)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.white)
                    .font(.system(size: 18, weight: .heavy, design: .default))
                    
            }
            .padding(.top,20)
          
            Spacer()
            
            
            VStack{
            
                Button(action: {
                       showNewPlayList = true
                   }, label: {
                       HStack{
                           Text("Nueva lista")
                               .font(.system(size: 15, weight: .heavy, design: .default))
                       }
                       .padding()
                      
                   })
                    .frame(width: 150)
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
            }
            .padding(.bottom,700)
        
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.black))
        .opacity(30.0)
        
        .fullScreenCover(isPresented: $showNewPlayList) {
            CreateNewPlayListView()
        }
    }
}

struct AddToPlayListReview_Previews: PreviewProvider {
    static var previews: some View {
        AddToPlayListView(audioBook: AudioBook())
    }
}
