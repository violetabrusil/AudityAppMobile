//
//  StarsView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/23/22.
//

import SwiftUI

struct StarsView: View {
    
    @Binding var rating: String
    
    private func startType(index: Int) -> String {
        
        if rating != nil {
            return index <= (rating as NSString).integerValue ? "star.fill" : "star"
        } else {
            return "star"
        }
    }
    
    var body: some View {
        
        HStack{
            
            ForEach(1...5, id: \.self) { index in
                Image(systemName: self.startType(index: index))
                    .foregroundColor(Color.yellow)
                    .onTapGesture {
                        self.rating = String(index)
                    
                    }
                   }
        }
        .frame(maxWidth: 250, maxHeight: 50)
        .background(Color(red: 24/255, green: 23/255, blue:22/255))
     
    }
    
   
}

struct StarsView_Previews: PreviewProvider {
    static var previews: some View {
        StarsView(rating: .constant("3"))
    }
}
