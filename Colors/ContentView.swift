//
//  ContentView.swift
//  Colors
//
//  Created by AnonymFromInternet on 20.09.21.
//

import SwiftUI


struct ContentView: View {
    
    @State private var show = false
    @State private var backAndForeGroundViewPosition = CGSize.zero
    @State private var detailInformationViewState = false
    @State private var detailInformationPosition = CGSize.zero
    @State private var detailInformationReading = false
    
    var body: some View {
        ZStack {
            
            TitleView()
                .blur(radius: show ? 14 : 0)
                .opacity(detailInformationViewState ? 0.4 : 1)
                .offset(y: detailInformationViewState ? -150 : 0)
                .animation(Animation
                            .timingCurve(0.3, 0.8, 0.3, 1, duration: 0.8)
                            .delay(0.1))
            
            BackgroungView(text: "Multithreading Course", shadowY: 0, shadowX: 0, radius: 0, color: .white)
                .frame(width: detailInformationViewState ? 306 : 336, height: 236)
                .background(show ? Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)) : Color(#colorLiteral(red: 0.8444776442, green: 1, blue: 0.2726826651, alpha: 1)))
                .cornerRadius(36)
                .shadow(radius: 36)
                .offset(x: 0, y: show ? -336 : -66)
                .offset(x: backAndForeGroundViewPosition.width, y: backAndForeGroundViewPosition.height)
                .offset(x: 0, y: detailInformationViewState ? -66 : 0)
                .scaleEffect(detailInformationViewState ? 1 : 0.9)
                .rotationEffect(.degrees(show ? 0 : 9))
                .rotation3DEffect(
                    .degrees(detailInformationViewState ? 0 : 9),
                    axis: (x: 9, y: 0.0, z: 0.0)
                    
                )
                .rotationEffect(.degrees(detailInformationViewState ? -9 : 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))
            
            BackgroungView(text: "UIKit Bootcamp by App Brewery", shadowY: 0, shadowX: 0, radius: 0, color: .white)
                .frame(width: 336, height: 236)
                .background(Color(#colorLiteral(red: 0.8078431373, green: 0.02745098039, blue: 0.3333333333, alpha: 1)))
                .cornerRadius(36)
                .shadow(radius: 36)
                .offset(x: 0, y:show ? -150 : -33)
                .offset(x: 0, y: detailInformationViewState ? -60 : 0)
                .offset(x: backAndForeGroundViewPosition.width, y: backAndForeGroundViewPosition.height)
                .scaleEffect(detailInformationViewState ? 1 : 0.93)
                .rotationEffect(.degrees(show ? 0 : 5))
                .rotation3DEffect(
                    .degrees(detailInformationViewState ? 0 : 5),
                    axis: (x: 9, y: 0.0, z: 0.0)
                )
                .rotationEffect(.degrees(detailInformationViewState ? -5 : 0))
                
                .animation(.easeInOut(duration: 0.3))
            
            
            ForegroundView()
                .frame(width: detailInformationViewState ? 365 : 336, height: 236)
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: detailInformationViewState ? 36 : 44, style: .continuous))
                .shadow(radius: 36)
                .blendMode(.hardLight)
                .offset(x: 0, y: detailInformationViewState ? -50 : 0)
                .offset(x: backAndForeGroundViewPosition.width, y: backAndForeGroundViewPosition.height)
                .onTapGesture {
                    self.detailInformationViewState.toggle()
                }
                .gesture(
                    DragGesture().onChanged({ value in
                        self.backAndForeGroundViewPosition = value.translation
                        self.show = true
                    })
                    .onEnded({ value in
                        self.backAndForeGroundViewPosition = .zero
                        self.show = false
                    })
                    
                )
                .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.5))
            
            
            DetailInformationView()
                .blur(radius: show ? 14 : 0)
                .animation(.timingCurve(0.3, 0.8, 0.3, 1, duration: 0.8))
                .offset(x: 0, y: detailInformationViewState ? 444 : 1000)
                .offset(y: detailInformationPosition.height)
                .gesture(DragGesture().onChanged({ value in
                    self.detailInformationPosition = value.translation
                    
                    if self.detailInformationReading {
                        self.detailInformationPosition.height += -344
                    }
                    if self.detailInformationPosition.height < -344 {
                        self.detailInformationPosition.height = -344
                    }
                    
                }).onEnded({ value in
                    
                    
                    if self.detailInformationPosition.height > 50 {
                        self.detailInformationViewState = false
                    }
                    
                    if self.detailInformationPosition.height < -93 {
                        
                        self.detailInformationPosition.height = -344
                        self.detailInformationReading = true
                        
                    } else {
                        self.detailInformationPosition = .zero
                        self.detailInformationReading = false
                    }
                }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

