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
                .shadow(color: Color.blackShadow, radius: 15, x: 15, y: 15)
                .shadow(color: Color.whiteShadow, radius: 15, x: -7.5, y: -7.5)
            Circle()
                .stroke(lineWidth: 15)
                .fill(Color.offWhite)
                .frame(width: 240, height: 240)
                .shadow(color: Color.blackShadow, radius: 7.5, x: 15, y: 15)
                .shadow(color: Color.whiteShadow, radius: 7.5, x: -7.5, y: -7.5)
        }
    }
}

struct PlateView_Previews: PreviewProvider {
    static var previews: some View {
        PlateView()
    }
}
