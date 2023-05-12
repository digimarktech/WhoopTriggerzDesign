//
//  ContentView.swift
//  WhoopTriggerzDesign
//
//  Created by Marc Aupont on 5/5/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .center) {
            gradientBackgroundView
            VStack {
                HStack {
                    CustomIconButton(image: "Left_arrow", width: 22) {
                        print("Left arrow tapped")
                    }
                    Spacer()
                    Button {
                        print("Church flow tapped")
                    } label: {
                        Text("Church Flow")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    Spacer()
                    CustomIconButton(image: "Favorite", width: 22) {
                        print("Favorite tapped")
                    }
                }
                .padding(.horizontal, 20)
                Spacer()
                PastorButton(width: 300) {
                    print("Pastor button pressed")
                }
                Spacer()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    var gradientBackgroundView: some View {
        LinearGradient(gradient: .init(colors: [
            Color(red: 0.26, green: 0.28, blue: 0.31),
            Color(red: 0.13, green: 0.14, blue: 0.15)
        ]), startPoint: .top, endPoint: .bottom)
        .edgesIgnoringSafeArea(.all)
    }
}
