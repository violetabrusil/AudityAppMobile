//
//  StarsView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/23/22.
//

import SwiftUI

struct StarsView: View {
    
    let fullCount: Int
    
    var body: some View {
        
        HStack{
            ForEach(0..<fullCount) { _ in
                     self.fullStar
                   }
        }
        .frame(maxWidth: 250, maxHeight: 50)
        .background(Color(.black))
     
    }
    
    private var fullStar: some View {
       Image(systemName: "star.fill")
            .resizable()
            .frame(width: 35, height: 35)
            .foregroundColor(Color.gray)
     }
}

struct StarsView_Previews: PreviewProvider {
    static var previews: some View {
        StarsView(fullCount: 5)
    }
}
