//
//  ContentView.swift
//  clock
//
//  Created by Rafael Almeida on 15/10/21.
//

import SwiftUI

struct ContentView: View {
    @State private var secondDegree: Double = 0.0
    @State private var minuteDegree: Double = 0.0
    @State private var hourDegree: Double = 0.0
        
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.offWhite)
                .frame(width: 160, height: 160)
                .shadow(color: Color.blackShadow, radius: 10, x: 10, y: 10)
                .shadow(color: Color.whiteShadow, radius: 10, x: -5, y: -5)
            Circle()
                .stroke(lineWidth: 10)
                .fill(Color.offWhite)
                .frame(width: 160, height: 160)
                .shadow(color: Color.blackShadow, radius: 5, x: 10, y: 10)
                .shadow(color: Color.whiteShadow, radius: 5, x: -5, y: -5)
            Capsule()
                .fill(.gray)
                .frame(width: 3, height: 75)
                .offset(x: 0, y: -37.5)
                .rotationEffect(.degrees(minuteDegree))
                .shadow(color: Color.blackShadow, radius: 2, x: 5, y: 5)
            Capsule()
                .fill(.gray)
                .frame(width: 3, height: 50)
                .offset(x: 0, y: -25)
                .rotationEffect(.degrees(hourDegree))
                .shadow(color: Color.blackShadow, radius: 2, x: 5, y: 5)
            Capsule()
                .fill(Color.darkRed)
                .frame(width: 3, height: 75)
                .offset(x: 0, y: -37.5)
                .rotationEffect(.degrees(secondDegree))
                .shadow(color: Color.blackShadow, radius: 2, x: 5, y: 5)
        }.onAppear() {
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                    let degreesPointer = getDegrees()
                    secondDegree = degreesPointer.secondPointer
                    hourDegree = degreesPointer.hourPointer
                    minuteDegree = degreesPointer.minutePointer
                }
                //its necessary because a swift bug
                true
            }
        }
    }
    
    private func getDegrees() -> (hourPointer: Double, minutePointer: Double,secondPointer: Double) {
        let time = getTime()
        let secondPointer = Double(time.second * 6)
        let minutePointer = Double(time.minute * 6)
        let hourPointer = Double(time.hour * 30)
        return(hourPointer,minutePointer,secondPointer)
    }
    
    private func getTime() -> (hour: Int, minute: Int,second: Int) {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        print("\(hour):\(minute):\(second)")
        return(hour,minute,second)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    static let darkRed = Color(red: 0.81, green: 0.22, blue: 0.22)
    static let blackShadow = Color.black.opacity(0.2)
    static let whiteShadow = Color.white.opacity(0.7)
}
