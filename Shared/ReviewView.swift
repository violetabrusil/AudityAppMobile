//
//  ReviewView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/23/22.
//

import SwiftUI

class TextFieldValidation: ObservableObject {
    
    let characterLimit = 200
    @Published var limitExceeded: Bool = false
    
    @Published var comment = "" {
        
        didSet {
            if comment.count > characterLimit {
                comment = String(comment.prefix(characterLimit))
                limitExceeded = true
            } else {
                limitExceeded = false
            }
        }
    }
}

struct ReviewView: View {
    
    @ObservedObject var reviewModel = ReviewViewModel()
    @Environment(\.dismiss) var dismiss
    @ObservedObject var user = UserViewModel()
    @ObservedObject var textFieldValidation = TextFieldValidation()
    @State var rating: String = "0"
    @State var success = false
    
    let audioBook: AudioBook
    
    public init(audioBook: AudioBook) {
        self.audioBook = audioBook
    }
    
    var body: some View {
        
        ZStack{
            if !success {
                
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
                        
                        Spacer()
                        
                        Text("¿Cómo califica este título?")
                            .foregroundColor(Color.white)
                            .font(.system(size: 20, weight: .heavy, design: .default))
                        StarsView(rating: $rating)
                        Text(rating != nil ? "Calificación: \(rating)" : "")
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    VStack(spacing: 30){
                        
                        TextField("Escriba aqui su comentario", text: $textFieldValidation.comment, axis: .vertical)
                            .frame(width: 370,height:300)
                            .overlay( RoundedRectangle(cornerRadius: 20) .stroke(Color.green) )
                            .foregroundColor(Color.white)
//                            .textFieldStyle(.roundedBorder)
                            .background(Color.clear)
                        
                        if textFieldValidation.limitExceeded {
                            HStack{
                                Spacer()
                                Text("Límite de caracteres alcanzado.")
                                    .foregroundColor(Color(.red))
                                    .font(.system(size: 11, weight: .heavy, design: .default))
                                    .multilineTextAlignment(.center)
                                Spacer()
                            }
                        }
                        
                        Button(action: {
                            if audioBook.idAudioBook != 0 && user.uuid != "" && textFieldValidation.comment != ""
                                && rating != "" {
                                let parameters: [String: Any] = ["userId": user.uuid!, "comment": textFieldValidation.comment,
                                                                 "rating":rating]
                                reviewModel.addReview(idAudioBook: String(audioBook.idAudioBook), parameters: parameters)
                                success = true
                            } else {
                                print("No se envio comentario")
                            }
                            
                        }, label: {
                            HStack{
                                Text("Enviar")
                                    .font(.system(size: 15, weight: .heavy, design: .default))
                            }
                            .padding()
                            
                        })
                            .frame(width: 150)
                            .background(Color("GreenColor"))
                            .foregroundColor(Color.white)
                            .cornerRadius(20)
                            .padding(.bottom,40)
                        Spacer()
                    }
                    //            .padding(.top)
                    Spacer()
                    
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red: 24/255, green: 23/255, blue:22/255))
            }
            else {
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
                    
                    VStack{
                        Text("Gracias por calificar este título :)")
                            .foregroundColor(Color.white)
                            .font(.system(size: 30, weight: .heavy, design: .default))
                            .frame(alignment: .center)
                        
                    }
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red: 24/255, green: 23/255, blue:22/255))
            }
            
        }
        
    }
    
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView(audioBook: AudioBook())
    }
}
