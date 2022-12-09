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
    
    func greetingLogic() -> String {
        
        let hour = Calendar.current.component(.hour, from: Date())
        
        let NEW_DAY = 0
        let NOON = 12
        let SUNSET = 18
        let MIDNIGHT = 24
        
        var greetingText = ""
        
        switch hour {
        case NEW_DAY..<NOON:
            greetingText = "Buenos días"
        case NOON..<SUNSET:
            greetingText = "Buenas tardes"
        case SUNSET..<MIDNIGHT:
            greetingText = "Buenas noches"
        default:
            _ = "Hola"
        }
        return greetingText
    }
    
    var body: some View {
        
        let greeting = greetingLogic()
        
        ZStack{
            
            VStack{
                
                HStack{
                    Text(greeting)
                        .padding(.leading, 10)
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
                    
                    
                }.padding(.top,3)
                
                
                HStack{
                    
                    Text("Hola \(user.user?.userName ?? "")")
//                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.white)
                        .font(.system(size: 25, weight: .heavy, design: .default))
                        .padding(.leading, 10)
                    Spacer()
                }.padding(.bottom, 5)
                
                VStack{
                    HStack{
                        Text("Recomendados")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color.white)
                            .font(.system(size: 25, weight: .heavy, design: .default))
                            .padding(.trailing, 200)
                    }
                    .padding(.bottom,90)
                    
                    
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
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color.white)
                            .font(.system(size: 25, weight: .heavy, design: .default))
                            .padding(.trailing, 150)
                        
                    }
                    .padding(.bottom,90)
                    
                    
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
