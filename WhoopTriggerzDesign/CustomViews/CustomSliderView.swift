//
//  CustomSliderView.swift
//  WhoopTriggerzDesign
//
//  Created by Dan Aupont on 5/22/23.
//

import SwiftUI

struct CustomSliderView: View {
    // MARK: - Properties
    @Binding var value : CGFloat
    @Binding var isMuted: Bool
    
    var body: some View {
        HStack {
            // Speaker Button
            Button(action: {
                // Speaker toggle button
                isMuted.toggle()
                //Check mute button
                print(isMuted ? "Muted" : "Unmuted")
                 
            }) {
                Image(isMuted ? "Mute" : "Volume")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                Capsule()
                    .fill(Color.sliderColor)
                    .frame(height: 6)
                
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .center)) {
                    Capsule()
                        .fill(LinearGradient(colors: [Color("blueGradientStartColor"), Color("blueGradientEndColor")], startPoint: .leading, endPoint: .trailing))
                        .frame(width: value,height: 6)
                    
                    Circle()
                        .fill(Color("VolumeColor").opacity(0.7))
                        .frame(width: 10, height: 10)
                        .padding(.all, 10)
                    Image("Volume_Slider_Knob")
                        .clipShape(Circle())
                }
            }//:ZSTACK
           
            .gesture(DragGesture().onChanged({ (dragValue) in
                //divide and subtract lower bound upper bound of the range to get a value between 0.0 and 1.0
                if dragValue.location.x <= UIScreen.main.bounds.width - 55 && dragValue.location.x >= 0{
                    let rangeValue = Double((dragValue.location.x - 0) / (UIScreen.main.bounds.width - 55))
                    //if it falls within the bounds print value
                    print("Slider range value: \(rangeValue)")
                    self.value = dragValue.location.x
                }

            }))
        }//:HSTACK
        .padding(.horizontal, 10)
    }
}

struct CustomSliderView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSliderView(value: .constant(50.0), isMuted: .constant(false))
    }
}
