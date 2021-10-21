//
//  ClockViewModel.swift
//  clock
//
//  Created by Rafael Almeida on 20/10/21.
//

import SwiftUI
import AVFoundation

class ClockViewModel: ObservableObject {
    @Published var secondPointerDegree: Double = 0.0
    @Published var minutePointerDegree: Double = 0.0
    @Published var hourPointerDegree: Double = 0.0
    private var player = Player()
    
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
            self.secondPointerDegree = degreesPointer.secondPointer
            self.hourPointerDegree = degreesPointer.hourPointer
            self.minutePointerDegree = degreesPointer.minutePointer
            self.player.playSound()
        }
    }
}
