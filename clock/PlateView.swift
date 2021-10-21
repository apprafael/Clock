//
//  PlateView.swift
//  clock
//
//  Created by Rafael Almeida on 17/10/21.
//

import SwiftUI

struct PlateView: View {
    var body: some View {
        ZStack{
            Circle()
                .fill(Color.offWhite)
                .frame(width: 240, height: 240)
                .shadow(color: Color.blackShadow, radius: 10, x: 10, y: 10)
                .shadow(color: Color.whiteShadow, radius: 10, x: -5, y: -5)
            Circle()
                .stroke(lineWidth: 10)
                .fill(Color.offWhite)
                .frame(width: 240, height: 240)
                .shadow(color: Color.blackShadow, radius: 5, x: 10, y: 10)
                .shadow(color: Color.whiteShadow, radius: 5, x: -5, y: -5)
        }
    }
}

struct PlateView_Previews: PreviewProvider {
    static var previews: some View {
        PlateView()
    }
}
