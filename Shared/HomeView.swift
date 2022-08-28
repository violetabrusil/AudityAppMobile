//
//  HomeView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/22/22.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var showSettings: Bool
    @Binding var showEditProfileView: Bool
    
    public init (showSettings:Binding<Bool>, showEditProfileView:Binding<Bool>){
        
        self._showSettings = showSettings
        self._showEditProfileView = showEditProfileView
        
    }

    var body: some View {
        
        ZStack{
            
            VStack{
                
                HStack{
                    Text("Buenas tardes")
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 5)
                        .foregroundColor(Color.white)
                        .font(.system(size: 30, weight: .heavy, design: .default))
                    Spacer()
                    Button(action: {
                        showSettings.toggle()
                       }, label: {
                           HStack{
                               Image("settings")
                                   .resizable()
                                   .frame(width: 35, height: 35)
                                   .padding()
                                   .foregroundColor(Color.white)
                           }
                       })
                }.padding(.top,30)
                
                Spacer()
                
                VStack{
                    
                    Text("Hola, ")
                        .multilineTextAlignment(.leading)
                        .padding(.leading, -200.0)
                        .frame(height:0)
                        .foregroundColor(Color.white)
                        .font(.system(size: 25, weight: .heavy, design: .default))
                        
                    Text("Recomendados")
                        .multilineTextAlignment(.leading)
                        .padding(.leading, -200.0)
                        .frame(width: 160,height:60)
                        .foregroundColor(Color.white)
                        .font(.system(size: 25, weight: .heavy, design: .default))
                    
                }.padding(.bottom, 610)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.black))
            
            if showSettings {
                SettingsView(showSettings: $showSettings, showEditProfileView: $showEditProfileView)
                    .offset(y: 20)
            }

        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showSettings: .constant(false), showEditProfileView: .constant(false))
    }
}
