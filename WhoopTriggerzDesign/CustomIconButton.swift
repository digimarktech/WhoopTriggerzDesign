//
//  CustomIconButton.swift
//  WhoopTriggerzDesign
//
//  Created by Marc Aupont on 5/11/23.
//

import SwiftUI

extension Color {
    static let darkStart = Color(red: 50 / 255, green: 60 / 255, blue: 65 / 255)
    static let darkEnd = Color(red: 25 / 255, green: 25 / 255, blue: 30 / 255)
    static let lightStart = Color(red: 60 / 255, green: 160 / 255, blue: 240 / 255)
    static let lightEnd = Color(red: 30 / 255, green: 80 / 255, blue: 120 / 255)
}

/// A custom button that displays an icon image in the center
struct CustomIconButton: View {
    /// The image name to use
    var image: String
    
    /// The width of the button
    var width: CGFloat
    
    /// The action to execute when the button is pressed.
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(image)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Color.white.opacity(0.8))
                .scaledToFit()
                .frame(width: width, height: width)
        }
            .buttonStyle(NeumorphicButtonStyle(padding: width))


    }
}

struct CustomIconButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomIconButton(image: "Left_arrow", width: 36) {}
            .previewLayout(.fixed(width: 300, height: 300))
    }
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct DarkBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S

    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(Color.darkEnd)
                    .shadow(color: Color.darkStart, radius: 10, x: 5, y: 5)
                    .shadow(color: Color.darkEnd, radius: 10, x: -5, y: -5)

            } else {
                shape
                    .fill(Color.darkEnd)
                    .shadow(color: Color.darkStart, radius: 10, x: -10, y: -10)
                    .shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
            }
        }
    }
}

struct DarkButtonStyle: ButtonStyle {
    var padding: CGFloat
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(padding * 0.75)
            .contentShape(Circle())
            .background(
                DarkBackground(isHighlighted: configuration.isPressed, shape: Circle())
            )
    }
}

struct NeumorphicButtonStyle: ButtonStyle {
    var padding: CGFloat
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(padding * 0.75)
            .contentShape(Circle())
            .background(
                Group {
                    if configuration.isPressed {
                        Circle()
                            .fill(LinearGradient(colors: [
                                Color(red: 0.19, green: 0.2, blue: 0.23),
                                Color(red: 0.17, green: 0.19, blue: 0.21)
                            ], startPoint: .leading, endPoint: .trailing))
                            .overlay(
                                Circle()
                                    .stroke(Color.black, lineWidth: 4)
                                    .blur(radius: 4)
                                    .offset(x: 2, y: 2)
                                    .mask(
                                        Circle()
                                            .fill(LinearGradient(Color.black, Color.clear))
                                    )
                            )
                    } else {
                        Circle()
                            .fill(LinearGradient(colors: [
                                Color(red: 0.19, green: 0.2, blue: 0.23),
                                Color(red: 0.17, green: 0.19, blue: 0.21)
                            ], startPoint: .leading, endPoint: .trailing))
                            .overlay(
                                Circle()
                                    .stroke(
                                        LinearGradient(colors: [
                                            Color(red: 0.19, green: 0.2, blue: 0.23, opacity: 0),
                                            Color(red: 0.17, green: 0.19, blue: 0.21)
                                        ], startPoint: .leading, endPoint: .trailing), lineWidth: 4
                                    )
                            )
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.6), radius: 22, x: 5, y: 5)
                            .shadow(color: Color(red: 0.8, green: 0.84, blue: 0.87, opacity: 0.2), radius: 22, x: -5.28, y: -5.28)
                    }
                    
                }
            )
    }
    
}
