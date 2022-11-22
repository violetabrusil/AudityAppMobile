//
//  ForgotPasswordView.swift
//  AudityAppMobile (iOS)
//
//  Created by Violeta on 8/30/22.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var vm = ForgotPasswordViewModelImpl(
        service: ForgotPasswordServiceImpl()
    )
    @ObservedObject var viewModel = AudityBaseViewModel()
    
    var body: some View {
        
        VStack{
            
            HStack{
                Text("Cambiar contraseña")
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 5)
                    .foregroundColor(Color.white)
                    .font(.system(size: 25, weight: .heavy, design: .default))
                Spacer()
                Button(action: {
                    viewModel.navigateToPreviousScreen()
                }, label: {
                    HStack{
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .padding()
                            .foregroundColor(Color.white)
                    }
                })
                
                
            }.padding(.top,25)
            
            Spacer()
            
            VStack{
                HStack(spacing:5){
                    Image(systemName: "envelop.fill")
                        .resizable()
                        .frame(width: 21, height: 25)
                        .padding()
                        .foregroundColor(Color.green)
                    
                    TextField("Ingrese su correo electrónico", text: $vm.email)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                }
                .frame(width: 370,height:50)
                .background()
                .cornerRadius(10)
             
                Button(action: {
                    vm.sendPasswordReset()
                    
                }, label: {
                    HStack{
                        Text("Enviar")
                            .font(.system(size: 15, weight: .heavy, design: .default))
                    }
                    .padding()
                })
                    .frame(width: 100)
                    .background(Color("GreenColor"))
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
        
            }
            
            Spacer()
            
            
 
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("fullBackground"))
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
