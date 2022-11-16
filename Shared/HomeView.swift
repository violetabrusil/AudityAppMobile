//
//  HomeView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/22/22.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showSettings = false
    @StateObject var audioBookViewModel = AudioBookViewModel()
    @EnvironmentObject var user: UserViewModel
  
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
                        showSettings = true
                    }, label: {
                        HStack{
                            Image("settings")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .padding()
                                .foregroundColor(Color.white)
                        }
                    })
                    
                    
                }.padding(.top,5)
                
                
                VStack{
                    
                    Text("Hola \(user.user?.userName ?? "")")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.white)
                        .font(.system(size: 25, weight: .heavy, design: .default))
                    
                    
                }.padding(.bottom, 30)
                
                VStack{
                    HStack{
                        Text("Recomendados")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color.white)
                            .font(.system(size: 25, weight: .heavy, design: .default))
                    }
                    .padding(.bottom,70)
                    
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        
                        HStack(spacing: 13){
                            ForEach(audioBookViewModel.audioBookList, id:\.self) { audioBook in
                                AudioBookView(audioBook: audioBook)
                                
                            }
                        }
                        
                    }
                    .onAppear{
                        audioBookViewModel.fetch()
                    }
                    .frame(height: 100)
                    
                }
                .padding(.bottom, 80)
                
                VStack{
                    HStack{
                        Text("Lo nuevo en Audity")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color.white)
                            .font(.system(size: 25, weight: .heavy, design: .default))
                        
                    }
                    .padding(.bottom,70)
                    
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        
                        HStack(spacing: 13){
                            ForEach(audioBookViewModel.audioBookList.reversed(), id:\.self) { audioBook in
                                AudioBookView(audioBook: audioBook)
                                
                            }
                        }
                        
                    }
                    .onAppear{
                        audioBookViewModel.fetch()
                    }
                    .frame(height: 100)
                    
                }
                .padding(.bottom, 60)
                Spacer()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("fullBackground"))
            .fullScreenCover(isPresented: $showSettings) {
               SettingsView()
            }
            
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        
    }
}
