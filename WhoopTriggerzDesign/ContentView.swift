//
//  ContentView.swift
//  WhoopTriggerzDesign
//
//  Created by Marc Aupont on 5/5/23.
//

import SwiftUI

struct ContentView: View {
    @State var sliderValue: CGFloat = 50
    var body: some View {
        ZStack {
            gradientBackgroundView
            VStack {
                Spacer()
                HStack{
                    customSlider(value: $sliderValue, speakerImage: "Volume" )
                }
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

