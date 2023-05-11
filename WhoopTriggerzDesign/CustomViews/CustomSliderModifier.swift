//
//  CustomSliderModifier.swift
//  WhoopTriggerzDesign
//
//  Created by Jessica Perez on 5/10/23.
//
import SwiftUI

struct CustomSliderModifier: ViewModifier {
    //MARK: - Properties
    @Binding var value : CGFloat
    @State var isMuted: Bool = false
    @State var speakerImage: String
//MARK: -Body
    func body(content: Content) -> some View {
        HStack {
            // Speaker Button
            Button(action: {
                // Speaker toggle button
                isMuted.toggle()
                speakerImage = isMuted ? "Mute" : "Volume"
                //Check mute button 
                print(isMuted ? "Muted" : "Unmuted")
                 
            }) {
                Image(speakerImage)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding()
            }
            
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                Capsule()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 6)
                
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .center)) {
                    Capsule()
                        .fill(Color.sliderColor.opacity(0.9))
                        .frame(width: value,height: 6)
                    
                    Circle()
                        .fill(Color("VolumeColor").opacity(0.7))
                        .frame(width: 10, height: 10)
                        .padding(.all, 10)
                    Image("Volume_Slider_Knob")
                        .clipShape(Circle())
                        .shadow(color: Color.gray.opacity(0.6),radius: 10,x: 4,y: 2)
                }
            }//:ZSTACK
           
            .gesture(DragGesture().onChanged({ (dragValue) in
                //divide and subtract lower bound upper bound of the range to get a value between 0.0 and 1.0
                if dragValue.location.x <= UIScreen.main.bounds.width - 30 && dragValue.location.x >= 0{
                    let rangeValue = Double((dragValue.location.x - 0) / (UIScreen.main.bounds.width - 30))
                    //if it falls within the bounds print value
                    print("Slider range value: \(rangeValue)")
                    self.value = dragValue.location.x
                }

            }))
        }//:HSTACK
        .padding(.horizontal, 10)
    }
}

//extension Custom modifier
extension View {
    func customSlider(value: Binding<CGFloat>, speakerImage: String) -> some View {
        self.modifier(CustomSliderModifier(value: value, speakerImage: speakerImage))
    }
}
