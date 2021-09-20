//
//  DetailInformationView.swift
//  Colors
//
//  Created by AnonymFromInternet on 20.09.21.
//

import SwiftUI

struct DetailInformationView: View {
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 44, height: 6)
                .cornerRadius(3.0)
                .opacity(0.3)
            Text("SwiftUI")
                .multilineTextAlignment(.center)
                .font(.title)
                .lineSpacing(4)
                .padding()
            Text("In this Bootcamp work and learning were carried out entirely on the framework SwiftUI\n\nIt covered topics such as:\n\nView structure, View types, property wrappers, View modifiers,  creating custom modifiers, building adaptive apps, Data fetching (sending and recieving Data from Internet), Data En- and Decoding with JSON, Multithreading, creating custom property wrappers.\n\nWorking with other frameworks sach as MapKit, CoreImage, LocalIdentification, CoreML, CreateML, CoreData. Integration of frameworks created for UIKit with SwiftUI. And much much more.")
                .foregroundColor(.black)
                .shadow(color: Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)), radius: 5, x: 3, y: 3)
                .multilineTextAlignment(.leading)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("Background 3"))
        .cornerRadius(36)
        .shadow(radius: 36)
        
    }
}

struct SwimmingView_Previews: PreviewProvider {
    static var previews: some View {
        DetailInformationView()
    }
}
