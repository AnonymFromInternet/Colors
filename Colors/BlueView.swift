//
//  BlueView.swift
//  Colors
//
//  Created by AnonymFromInternet on 20.09.21.
//

import SwiftUI

struct BlueView: View {
    @Binding var showingProfile: Bool
    var body: some View {
        VStack {
            HStack {
                LoginImage(showingProfile: $showingProfile)
                    .background(Color.black) // Потом удалить
                Spacer()
            }
            .padding(.horizontal, 33)
            .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack() {
                    ForEach(infoData) { item in
                        GeometryReader { geometry in
                            Info(forInfo: item)
                                .rotation3DEffect(
                                    Angle(degrees: Double(geometry.frame(in: .global).minX - 33) / -14),
                                    axis: (x: 0.0, y: 9.0, z: 0.0)
                                )
                        }
                        .frame(width: 280, height: 280)
                    }
                }
                .padding(33)
                .padding(.bottom, 33)
            }
            
            Spacer()
        }
    }
}

struct BlueView_Previews: PreviewProvider {
    static var previews: some View {
        BlueView(showingProfile: .constant(false))
    }
}

struct Info: View {
    
    var forInfo: ForInfo
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(forInfo.title)
                    .font(.system(size: 33, weight: .bold)).frame(width: 140, alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                Image(forInfo.logo)
            }
            Text(forInfo.text.uppercased())
            forInfo.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 190)
        }
        .padding(.top, 9)
        .padding(.horizontal)
        .frame(width: 280, height: 280)
        .background(forInfo.color)
        .cornerRadius(33)
        .shadow(color: forInfo.color.opacity(0.4), radius: 9, x: -9, y: 0)
    }
}

struct ForInfo: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image
    var color: Color
}

let infoData = [
    
    ForInfo(title: "SwiftUI", text: "3 Months", logo: "Logo SwiftUI", image: Image("1"), color: Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))),
    ForInfo(title: "UIKit", text: "3 Months", logo: "Logo SwiftUI", image: Image("3"), color: Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))),
    ForInfo(title: "Multithreading", text: "", logo: "", image: Image("6"), color: Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)))
    
]
