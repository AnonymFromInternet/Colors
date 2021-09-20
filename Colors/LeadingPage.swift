//
//  LeadingPage.swift
//  Colors
//
//  Created by AnonymFromInternet on 20.09.21.
//

import SwiftUI

struct LeadingPage: View {
    
    @State private var showingProfile = false
    @State private var userLoginViewPosition = CGSize.zero
    
    var body: some View {
        
        ZStack {
            Color(#colorLiteral(red: 1, green: 0.9294117647, blue: 0.6392156863, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            BlueView(showingProfile: $showingProfile)
                .padding(.top, 44)
                .background(Color(#colorLiteral(red: 0.2619419449, green: 0.04473236153, blue: 0.7046496315, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 36, style: .continuous))
                .shadow(color: Color.red.opacity(0.4), radius: 33, x: -8, y: -8)
                .offset(y: showingProfile ? -444 : 0)
                .rotation3DEffect(
                    Angle(degrees: showingProfile ? Double(userLoginViewPosition.height) / 9 - 10 : 0),
                    axis: (x: 9, y: 0, z: 0)
                )
                .scaleEffect(showingProfile ? 0.9 : 1)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .edgesIgnoringSafeArea(.all)
            
            Menu()
                .background(Color.black.opacity(0.001))
                .offset(y: showingProfile ? 0 : forAdaptive.height)
                .offset(y: userLoginViewPosition.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showingProfile.toggle()
                }
                .gesture(
                    DragGesture().onChanged({ value in
                        self.userLoginViewPosition = value.translation
                        
                        if userLoginViewPosition.height > 150 {
                            self.showingProfile = false
                        }
                    })
                    .onEnded({ value in
                        self.userLoginViewPosition = .zero
                    })
                )
        }
    }
}

struct LeadingPage_Previews: PreviewProvider {
    static var previews: some View {
        LeadingPage()
    }
}

struct LoginImage: View {
    
    @Binding var showingProfile: Bool
    
    var body: some View {
        Button(action: {
            self.showingProfile.toggle()
        }, label: {
            Image("1")
                .resizable()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
                .blendMode(.plusLighter)
            
        })
    }
}

let forAdaptive = UIScreen.main.bounds
