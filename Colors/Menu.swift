//
//  Menu.swift
//  Colors
//
//  Created by AnonymFromInternet on 20.09.21.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 14) {
                Color.white
                    .frame(width: 44, height: 6)
                    .cornerRadius(9)
                    .frame(width: 136, height: 6, alignment: .center)
                    .background(Color(#colorLiteral(red: 0.137254902, green: 0.137254902, blue: 0.137254902, alpha: 1)).opacity(0.3))
                    .cornerRadius(3.0)
                    .padding()
                    .frame(width: 150, height: 33)
                    .background(Color(#colorLiteral(red: 0.137254902, green: 0.137254902, blue: 0.137254902, alpha: 1)).opacity(0.1))
                    .cornerRadius(5)
                
                UserAccount(title: "User Account", image: "gear")
                UserAccount(title: "Score", image: "creditcard")
                UserAccount(title: "Exit", image: "person.crop.circle")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 330)
            .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.red]), startPoint: .bottom, endPoint: .top))
            .clipShape(RoundedRectangle(cornerRadius: 33, style: .continuous))
            .padding(.horizontal, 33)
            //            .shadow(radius: 36)
            .shadow(color: Color.red.opacity(0.6), radius: 33, x: -14, y: -14)
            .overlay(
                Image("1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 44, height: 44)
                    .clipShape(Circle())
                    .offset(y: -165)
                    .blendMode(.saturation)
            )
        }
        .padding(.bottom, 33)
    }
}


struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}

struct UserAccount: View {
    
    var title: String
    var image: String
    
    var body: some View {
        HStack(spacing: 33) {
            Image(systemName: image)
                .font(.system(size: 33, weight: .light, design: .default))
                .imageScale(.large)
                .frame(width: 33, height: 33)
                .foregroundColor(Color(#colorLiteral(red: 0.2743311711, green: 0.4291634228, blue: 0.957168425, alpha: 1)))
                .shadow(color: .red, radius: 10, x: -5, y: 0.0)
            Text(title)
                .font(.system(size: 33, weight: .semibold, design: .rounded))
                .frame(width: 140, alignment: .leading)
        }
    }
}
