//
//  Extensions.swift
//  AudityAppMobile (iOS)
//
//  Created by Violeta on 9/5/22.
//

import Foundation

extension DateComponentsFormatter {
    
    static let abbreviated: DateComponentsFormatter = {
        
        print("Initializing DateComponentsFormatter.abbreviated")
        let formatter = DateComponentsFormatter()
        
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        
        return formatter

    }()
    
    static let positional: DateComponentsFormatter = {
        
        print("Initializing DateComponentsFormatter.abbreviated")
        let formatter = DateComponentsFormatter()
        
        formatter.allowedUnits = [.hour,.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        
        return formatter

    }()
}
