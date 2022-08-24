//
//  ReproductorView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/22/22.
//

import SwiftUI

struct ReproductorView: View {
    var body: some View {
        VStack{
            HStack(spacing:110){
                Button(action: {
                       print("Down")
                   }, label: {
                       HStack{
                           Image(systemName: "chevron.down")
                               .resizable()
                               .frame(width: 15, height: 10)
                               .padding()
                               .foregroundColor(Color.white)
                       }
                   })
                
                Text("Genero")
                    .frame(width: 80)
                    .multilineTextAlignment(.center)
                    .padding(.leading, 5)
                    .foregroundColor(Color.white)
                    .font(.system(size: 16, weight: .heavy, design: .default))
            
                Button(action: {
                       print("Settings")
                   }, label: {
                       HStack{
                           Image(systemName: "ellipsis")
                               .resizable()
                               .frame(width: 15, height: 5)
                               .padding()
                               .foregroundColor(Color.white)
                       }
                   })
            }.padding(.top,30)
            Spacer()
            VStack{
                Image("aslan")
                    .resizable()
                    .frame(width: 350, height: 350)
            }
            Spacer()
            VStack{
                Text("Nombre Audiolibro")
                    .foregroundColor(Color.white)
                    .padding(.trailing, 220.0)
                    
                    
                
                Text("Nombre Autor")
                    .foregroundColor(Color.white)
                    .padding(.trailing, 255.0)
            }
            Spacer()
            VStack{
                HStack{
                    Button(action: {
                           print("Settings")
                       }, label: {
                           HStack{
                               Image(systemName: "chevron.down")
                                   .resizable()
                                   .frame(width: 15, height: 10)
                                   .padding()
                                   .foregroundColor(Color.white)
                           }
                       })
                    
                    Text("Genero")
                        .frame(width: 80)
                        .multilineTextAlignment(.center)
                        .padding(.leading, 5)
                        .foregroundColor(Color.white)
                        .font(.system(size: 16, weight: .heavy, design: .default))
                
                    Button(action: {
                           print("Settings")
                       }, label: {
                           HStack{
                               Image(systemName: "ellipsis")
                                   .resizable()
                                   .frame(width: 15, height: 5)
                                   .padding()
                                   .foregroundColor(Color.white)
                           }
                       })
                    
                }
            }
            
           
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.black))
        
}

struct ReproductorView_Previews: PreviewProvider {
    static var previews: some View {
        ReproductorView()
    }
}
}
