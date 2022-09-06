//
//  PlaybackControlButton.swift
//  AudityAppMobile (iOS)
//
//  Created by Violeta on 9/5/22.
//

import SwiftUI

struct PlaybackControlButton: View {
    
    var systemName: String = "play"
    var fontSize: CGFloat = 24
    var color: Color = .black
    var action: () -> Void
    
    var body: some View {
        
        Button{
            action()
        } label: {
            Image(systemName: systemName)
                .font(.system(size: fontSize))
                .foregroundColor(color)
        }
     
    }
}

struct PlaybackControlButton_Previews: PreviewProvider {
    static var previews: some View {
        PlaybackControlButton(action: {})
            .preferredColorScheme(.dark)
    }
}
