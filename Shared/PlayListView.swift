//
//  PlayListView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/24/22.
//

import SwiftUI

struct PlayListView: View {
    var body: some View {
        VStack{
         
            HStack{
                Image("aslan")
                    .resizable()
                    .frame(width: 90, height:90)
                    .padding(.leading, -100.0)
            
                VStack{
                    Text("Nombre playlist")
                        .multilineTextAlignment(.leading)
                        .frame(width: 150)
                        .foregroundColor(Color.white)
                        .font(.system(size: 15, weight: .heavy, design: .default))
                    Text("2 audiolibroa")
                        .frame(width: 150)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.white)
                        .font(.system(size: 15))
                }
             
                
            }
            .frame(width: 420, height: 100)
        }
        .frame(width: .infinity, height: .infinity)
        .background(Color("fullBackground"))
    }
}

struct PlayListView_Previews: PreviewProvider {
    static var previews: some View {
        PlayListView()
    }
}
