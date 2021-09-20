//
//  ForegroundView.swift
//  Colors
//
//  Created by AnonymFromInternet on 20.09.21.
//

import SwiftUI

struct ForegroundView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("SwiftUI Bootcamp")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Text("By Paul Hudson")
                        .foregroundColor(Color("Primary"))
                }
                
                Spacer()
                Image("Logo SwiftUI")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 65)
            }
            .padding(.horizontal, 36)
            .padding(.top, 36)
            
            Image("image")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 336, height: 66, alignment: .top)
        }
       
    }
}

struct ForegroundView_Previews: PreviewProvider {
    static var previews: some View {
        ForegroundView()
    }
}
