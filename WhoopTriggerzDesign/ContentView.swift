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
                
                ZStack {
                    Circle()
                        .frame(width: 50)
                    HStack(spacing: 100) {
                        
                        Button {
                            print("Praise Break Button Pressed")
                        } label: {
                            Text("Praise Break ")
                                .foregroundColor(.white)
                        }
                        .offset(x: -30)
                        Button {
                            print("Worship Button Pressed")
                        } label: {
                            Text("Worship")
                                .foregroundColor(.white)
                        }
                        
                    }
                }
                
                HStack(spacing: 34) {
                    CustomIconButton(image: "Key", width: 22) {
                        print("Key tapped")
                    }
                    CustomStepperButton()
                    CustomIconButton(image: "Key", width: 22) {
                        print("Left arrow tapped")
                    }
                }
                .padding(.bottom, 60)

//                Spacer()
                HStack(alignment: .bottom) {
                    CustomIconButton(image: "Music_tune", width: 22) {
                        print("Left arrow tapped")
                    }
                    PastorButton(width: 270) {
                        print("Pastor button pressed")
                    }
                    CustomIconButton(image: "Reload", width: 22) {
                        print("Left arrow tapped")
                    }
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
