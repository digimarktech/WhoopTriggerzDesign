//
//  PastorButton.swift
//  WhoopTriggerzDesign
//
//  Created by Marc Aupont on 5/8/23.
//

import SwiftUI

struct PastorButton: View {
    var width: CGFloat
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Circle()
                    .fill(.black.opacity(0.8))
                    .shadow(color: .black, radius: 54)
                Circle()
                    .fill(
                        LinearGradient(colors: [
                            Color(red: 0.07, green: 0.64, blue: 0.99),
                            Color(red: 0.0, green: 0.51, blue: 0.79)], startPoint: .leading, endPoint: .trailing)
                    )
                    .padding(width * 0.03)
                    .blur(radius: 1.93)
                Circle()
                    .fill(
                        LinearGradient(colors: [Color(red: 0.4, green: 0.65, blue: 1.0), Color(red: 0.23, green: 0.26, blue: 0.96)], startPoint: .bottomTrailing, endPoint: .topLeading)
                    )
                    .padding()
                    .padding(width * 0.015)
                    .offset(y: width * 0.01)
                    .blur(radius: 1.93)
                Image("pastor")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .padding(width * 0.03)
                    .offset(y: width * 0.2)
                                        
                    .clipShape(Circle().offset(y: width * 0.08))
                    .frame(width: width * 0.82)
            }
            .frame(width: width)
            
        }

    }
}

struct PastorButton_Previews: PreviewProvider {
    static var previews: some View {
        PastorButton(width: 300) {}
    }
}
