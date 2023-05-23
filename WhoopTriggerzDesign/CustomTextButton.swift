//
//  CustomTextButton.swift
//  WhoopTriggerzDesign
//
//  Created by Marc Aupont on 5/17/23.
//

import SwiftUI

struct CustomTextButton: View {
    @State private var normalToggled: Bool = false
    @State private var specialToggled: Bool = false
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                Toggle(isOn: $normalToggled) {
                    Text("Normal")
                        .font(.body2())
                }
                .toggleStyle(GradientToggleStyle(shape: Capsule()))
                
                Toggle(isOn: $specialToggled) {
                    Text("Special")
                        .font(.body2())
                }
                .toggleStyle(GradientToggleStyle(shape: Capsule()))
            }
            .padding()
//                .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 20)
                                        .fill(Color(red: 53/255, green: 58/255, blue: 64/255))
//                                        .stroke(.black, lineWidth: 0.3)
//                                        .frame(width: proxy.size.width * 0.9, height: proxy.size.height * 0.12)
                                        .shadow(color: Color(red: 38/255, green: 40/255, blue: 44/255), radius: 2, x: 2, y: 2)
                                        .shadow(color: Color(red: 73/255, green: 76/255, blue: 83/255), radius: 2, x: -2, y: -2)
                                        .shadow(color: Color(red: 45/255, green: 47/255, blue: 50/255), radius: 2, x: -2, y: -2)
                                        .shadow(color: Color(red: 72/255, green: 76/255, blue: 82/255), radius: 2, x: 2, y: 2)
                                        
        )
        }
    }
}

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 16)
            .padding(.horizontal, 48)
            .background(.green)
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}

struct GradientToggleStyle<S: Shape>: ToggleStyle {
    var shape: S
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            configuration.label
                .padding(.vertical, 16)
                .padding(.horizontal, 48)
                .foregroundColor(Color.white.opacity(configuration.isOn ? 1 : 0.4))
                .clipShape(shape)
        }
        .background(
            GradientBackground(isHighlighted: configuration.isOn, shape: shape)
        )

    }
}

struct GradientRingToggleStyle<S: Shape>: ToggleStyle {
    var shape: S
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            configuration.label
                .padding(.vertical, 16)
                .padding(.horizontal, 20)
                .foregroundColor(Color.white.opacity(configuration.isOn ? 1 : 0.4))
                .clipShape(shape)
                .overlay(
                    shape
                        .stroke(Color.black)
                )
        }
        .background(
            GradientBackground(isHighlighted: configuration.isOn, shape: shape)
        )

    }
}

struct CustomTextButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CustomTextButton()
            CustomTextButton()
                .previewDevice(PreviewDevice(rawValue: "iPad (10th generation)"))
        }
        
    }
}



struct GradientBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S

    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(LinearGradient.blueGradient)
//                    .overlay(shape.stroke(LinearGradient(Color.lightStart, Color.lightEnd), lineWidth: 4))
                    .shadow(color: Color(red: 0.12, green: 0.14, blue: 0.15), radius: 12, x: 5, y: 5)
                    .shadow(color: Color(red: 0.28, green: 0.31, blue: 0.34), radius: 12, x: -5, y: -5)

            } else {
                shape
                    .fill(LinearGradient.darkThemeButtonGradient)
                    .shadow(color: Color(red: 0.12, green: 0.14, blue: 0.15), radius: 12, x: 5, y: 5)
                    .shadow(color: Color(red: 0.28, green: 0.31, blue: 0.34), radius: 12, x: -5, y: -5)
            }
        }
    }
}

extension LinearGradient {
    static var blueGradient: LinearGradient {
        .init(colors: [
            Color(red: 59/255, green: 66/255, blue: 245/255),
            Color(red: 101/255, green: 167/255, blue: 255/255)
        ], startPoint: .leading, endPoint: .trailing)
    }
    
    static var reverseBlueGradient: LinearGradient {
        .init(colors: [
            Color(red: 101/255, green: 167/255, blue: 255/255),
            Color(red: 59/255, green: 66/255, blue: 245/255)
        ], startPoint: .leading, endPoint: .trailing)
    }
    
    static var darkThemeButtonGradient: LinearGradient {
        .init(colors: [
            Color(red: 0.18, green: 0.21, blue: 0.23),
            Color(red: 0.11, green: 0.12, blue: 0.13),
        ], startPoint: .leading, endPoint: .trailing)
    }

}
