//
//  ContentView.swift
//  clock
//
//  Created by Rafael Almeida on 15/10/21.
//

import SwiftUI

struct ContentView: View {
    @State private var secondPointer: Pointer = Pointer(height: 65.0, degree: 0, color: Color.red)
    @State private var minutePointer: Pointer = Pointer(height: 65.0, degree: 0, color: .gray)
    @State private var hourPointer: Pointer = Pointer(height: 50.0, degree: 0, color: .gray)
    
    var body: some View {
        ZStack {
            PlateView()
            PointerView(pointer: minutePointer)
            PointerView(pointer: hourPointer)
            PointerView(pointer: secondPointer)
        }.onAppear() {
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                    let degreesPointer = getDegrees()
                    secondPointer.degree = degreesPointer.secondPointer
                    hourPointer.degree = degreesPointer.hourPointer
                    minutePointer.degree = degreesPointer.minutePointer
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
        return(hour,minute,second)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
