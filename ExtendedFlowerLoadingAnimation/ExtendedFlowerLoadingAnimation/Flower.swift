import Foundation
import SwiftUI

struct Flower: View {
    @State var offset: CGFloat
    @State var radius: CGFloat

    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(Color.white, lineWidth: 3.0)
                .frame(width: radius, height: radius)
                .background(Color.clear)
                .offset(x: -offset, y: 0.0)
            Circle()
                .strokeBorder(Color.white, lineWidth: 3.0)
                .frame(width: radius, height: radius)
                .background(Color.clear)
                .offset(x: offset, y: 0.0)
            Circle()
                .strokeBorder(Color.white, lineWidth: 3.0)
                .frame(width: radius, height: radius)
                .background(Color.clear)
                .offset(x: 0.0, y: -offset)
            Circle()
                .strokeBorder(Color.white, lineWidth: 3.0)
                .frame(width: radius, height: radius)
                .background(Color.clear)
                .offset(x: 0.0, y: offset)
        }
    }
}
