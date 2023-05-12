//
//  CustomStepperButton.swift
//  WhoopTriggerzDesign
//
//  Created by Marc Aupont on 5/12/23.
//

import SwiftUI

struct CustomStepperButton: View {
    var body: some View {
        HStack(spacing: 40) {
            Button {
                
            } label: {
                Image("Left_arrow")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color.white)
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            }
            
            Text("B")
                .foregroundColor(.white)
            Button {
                
            } label: {
                Image("Right_arrow")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color.white)
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            }
        }
        .padding(16)
        .background(
            Capsule()
                .fill(Color(red: 0.18, green: 0.21, blue: 0.23))
                .overlay(
                    Capsule()
                        .stroke(.black, lineWidth: 4)
                )
        )
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.6), radius: 22, x: 5, y: 5)
        .shadow(color: Color(red: 0.8, green: 0.84, blue: 0.87, opacity: 0.2), radius: 22, x: -5.28, y: -5.28)
    }
}

struct CustomStepperButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomStepperButton()
    }
}
