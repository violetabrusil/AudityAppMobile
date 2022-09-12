//
//  MoreInformationView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/23/22.
//

import SwiftUI

struct MoreInformationView: View {
    
    let audityViewModel = AudityBaseViewModel()
    let audioBook: AudioBook
    
    public init(audioBook: AudioBook) {
        self.audioBook = audioBook
    }
    var body: some View {
        
        VStack(spacing: 50){
            
            HStack{
                Button(action: {
                    audityViewModel.navigateToPreviousScreen()
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
                
                AsyncImage(url: URL(string: audioBook.urlImage)) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                    
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 150, height: 150)
                
                Spacer()
                
                VStack{
                    Text(audioBook.titleAudioBook)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(Color.white)
                        
                    
                    Text(audioBook.author)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(Color.white)
                      
                    
                    Text(audioBook.gender)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(Color.white)
                    
                }
                
                Spacer()
                
               
            }
        
        
            VStack{
               
                Button(action: {
                    audityViewModel.nextScreenType = NeutralScreenType.AddToPlayListView.rawValue
                    audityViewModel.goToNextScreen = true
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
                    audityViewModel.nextScreenType = NeutralScreenType.ReviewView.rawValue
                    audityViewModel.goToNextScreen = true
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
        MoreInformationView(audioBook: AudioBook())
    }
}
