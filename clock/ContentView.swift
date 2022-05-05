//
//  ContentView.swift
//  clock
//
//  Created by Rafael Almeida on 15/10/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ClockViewModel = ClockViewModel()
    
    var body: some View {
        ZStack {
            PlateView()
            PointerView(pointer: Pointer(height: 75.0,
                                         degree: viewModel.hourPointerDegree,
                                         color: .lightGray))
            PointerView(pointer:  Pointer(height: 100.0,
                                          degree: viewModel.minutePointerDegree,
                                          color: .lightGray))
            PointerView(pointer: Pointer(height: 100.0,
                                         degree: viewModel.secondPointerDegree,
                                         color: Color.darkRed))
        }.onAppear() {
            viewModel.startClock()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
