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
            PointerView(pointer: viewModel.hourPointer)
            PointerView(pointer: viewModel.minutePointer)
            PointerView(pointer: viewModel.secondPointer)
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
