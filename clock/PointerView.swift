//
//  PointerView.swift
//  clock
//
//  Created by Rafael Almeida on 16/10/21.
//

import SwiftUI

struct PointerView: View {
    var pointer: Pointer
    
    var body: some View {
        Capsule()
            .fill(pointer.color)
            .frame(width: 4.5, height: pointer.height)
            .offset(x: 0, y: -(pointer.height/2))
            .rotationEffect(.degrees(pointer.degree))
            .shadow(color: Color.blackShadow, radius: 2, x: 5, y: 5)
    }
}

struct PointerView_Previews: PreviewProvider {
    static var previews: some View {
        PointerView(pointer: Pointer(height: 65, degree: 10, color: .gray))
    }
}
