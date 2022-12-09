//
//  PlayListView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/24/22.
//

import SwiftUI

struct PlayListView: View {
    
    let playList: PlayList
    let audityViewModel = AudityBaseViewModel()
    
    public init(playList: PlayList) {
        self.playList = playList
    }
    
    var body: some View {
        VStack{
         
            HStack{
           
                Image("playList")
                    .resizable()
                    .frame(width: 90, height:90)
                    .padding(.leading, 20)
            
                VStack{
                    Text(playList.namePlayList)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.white)
                        .font(.system(size: 15, weight: .heavy, design: .default))
                    if playList.idAudioBooks != nil {
                        Text("\(playList.idAudioBooks!.count) audiolibros")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color.white)
                            .font(.system(size: 15))
                        
                    } else {
                        Text("Sin audiolibros")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color.white)
                            .font(.system(size: 15))
                    }
                  
                     
                }
       
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
        }
        .background(Color("fullBackground"))
    }
}

struct PlayListView_Previews: PreviewProvider {
    static var previews: some View {
        PlayListView(playList: PlayList())
    }
}
