//
//  BackgroundView.swift
//  Colors
//
//  Created by AnonymFromInternet on 20.09.21.
//

import SwiftUI

struct BackgroungView: View {
    var text: String
    var shadowY: CGFloat
    var shadowX: CGFloat
    var radius: CGFloat
    var color: Color

    
    var body: some View {
        VStack {
            Text(text)
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(.semibold)
                .shadow(color: color, radius: radius, x: shadowX, y: shadowY)
                .multilineTextAlignment(.center)
                
                .padding(.top, 50)
            Spacer()
        }
   }
}


