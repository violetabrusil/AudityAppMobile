//
//  ReviewView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/23/22.
//

import SwiftUI

struct ReviewView: View {
    
    @Environment(\.dismiss) var dismiss
//    @StateObject private var vm: ReviewViewModel
    @ObservedObject var user = UserViewModel()
    
    let audioBook: AudioBook
  
    public init(audioBook: AudioBook) {
        self.audioBook = audioBook
//        self.vm = ReviewViewModel(idAudioBook: audioBook.idAudioBook)
    }
    
    var body: some View {
        VStack {
            HStack{
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
            }
            .padding(.trailing, 300.0)
            Spacer()
            VStack(spacing: 5){
                
                AsyncImage(url: URL(string: audioBook.urlImage)) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                    
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 180, height: 180)
              
                
                Text("¿Cómo califica este título?")
                    .foregroundColor(Color.white)
                    .font(.system(size: 20, weight: .heavy, design: .default))
//                StarsView(rating: $vm.review.rating)
//                Text($vm.review.rating != nil ? "Calificación: \(vm.review.rating!)" : "")
                    .foregroundColor(Color.white)
            }
            Spacer()
            VStack(spacing: 30){
////                TextField("Escriba aqui su comentario", text: $vm.review.comment)
//                    .frame(width: 370,height:300)
//                    .overlay( RoundedRectangle(cornerRadius: 20) .stroke(Color.green) )
//                    .multilineTextAlignment(.leading)
//                    .foregroundColor(Color.white)
                
                Button(action: {
//                    vm.addReview(completion: { result in
//                        switch result {
//                        case .success(let message):
//                            print("Reseña enviada \(message)")
//                        case.failure(let error):
//                            print("an error ocurred \(error)")
//                        }
//
//                    })
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
                    .padding(.bottom,40)
                Spacer()
            }
//            .padding(.top)
            Spacer()
        
            
           
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.black))
    }
    
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView(audioBook: AudioBook())
    }
}
