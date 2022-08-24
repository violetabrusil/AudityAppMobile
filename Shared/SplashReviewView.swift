//
//  SplashReviewView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/23/22.
//

import SwiftUI

struct SplashReviewView: View {
    var body: some View {
        ZStack{
            ReviewView()
            StarsView(fullCount: 5)
        }
    }
}

struct SplashReviewView_Previews: PreviewProvider {
    static var previews: some View {
        SplashReviewView()
    }
}
