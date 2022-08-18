//
//  CapsuleView.swift
//  LoaderXLVIIAnimation
//
//  Created by Amit Palo on 18/08/22.
//

import SwiftUI

struct CapsuleView: View {
    @Binding var size: CGSize
    @State var color: Color
    @State var lineWidth: CGFloat
    @Binding var offset: CGPoint
    
    var body: some View {
        ZStack {
            Capsule()
                .stroke(style: .init(lineWidth: lineWidth))
                .foregroundColor(color)
                .frame(width: size.width, height: size.height)
                .offset(x: offset.x, y: offset.y)
        }
    }
}

struct CapsuleView_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleView(size: Binding.constant(CGSize(width: 50,
                                                  height: 50)),
                    color: .green,
                    lineWidth: 15,
                    offset: Binding.constant(.zero))
    }
}
