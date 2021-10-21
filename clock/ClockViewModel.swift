//
//  ClockViewModel.swift
//  clock
//
//  Created by Rafael Almeida on 20/10/21.
//

import SwiftUI

class ClockViewModel: ObservableObject {
    @Published var secondPointer: Pointer
    @Published var minutePointer: Pointer
    @Published var hourPointer: Pointer
    
    init() {
        secondPointer = Pointer(height: 65.0, degree: 0, color: Color.red)
        minutePointer = Pointer(height: 65.0, degree: 0, color: .gray)
        hourPointer = Pointer(height: 50.0, degree: 0, color: .gray)
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
    
    func startClock() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            let degreesPointer = self.getDegrees()
            self.secondPointer.degree = degreesPointer.secondPointer
            self.hourPointer.degree = degreesPointer.hourPointer
            self.minutePointer.degree = degreesPointer.minutePointer
        }
    }
}
