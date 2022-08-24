//
//  AudioBookView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/22/22.
//

import SwiftUI

struct AudioBookView: View {
    var body: some View {
        VStack{
            Image("aslan")
                .resizable()
                .frame(width: 153, height: 153)
            
            Text("Nombre Audiolibro")
                .foregroundColor(Color.white)
            
            Text("Nombre Autor")
                .foregroundColor(Color.white)
        }
        .background(Color(.black))
                
            
        
    }
}

struct AudioBookView_Previews: PreviewProvider {
    static var previews: some View {
        AudioBookView()
    }
}
