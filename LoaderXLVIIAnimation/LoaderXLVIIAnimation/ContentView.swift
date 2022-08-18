//
//  ContentView.swift
//  LoaderXLVIIAnimation
//
//  Created by Amit Palo on 18/08/22.
//

import SwiftUI

private struct Constants {
    static let capsuleSize: CGFloat = 40
    static let lineWidth: CGFloat = 10
    static let spacing: CGFloat = 20
    static let animationDuration = 0.5
    static let animationDelayDuration = 0.3
    static let nextAnimationDuration = 0.8
}

struct ContentView: View {
    
    private let colorArray: [Color] = [.orange, .cyan, .green]
    @State private var capsuleViewSizeArray = [CGSize(width: Constants.capsuleSize,
                                                      height: Constants.capsuleSize),
                                               CGSize(width: Constants.capsuleSize,
                                                      height: Constants.capsuleSize),
                                               CGSize(width: ((Constants.capsuleSize*2) + Constants.spacing),
                                                      height: Constants.capsuleSize)]
    @State private var capsuleViewOffsetArray = [CGPoint(x: -30, y: 0),
                                                 CGPoint(x: 30, y: 0),
                                                 CGPoint(x: 0, y: 60)]
    
    var body: some View {
        return ZStack {
            Color.black.ignoresSafeArea()
            ZStack {
                ForEach(0..<3) { i in
                    CapsuleView(size: $capsuleViewSizeArray[i],
                                color: colorArray[i],
                                lineWidth: Constants.lineWidth,
                                offset: $capsuleViewOffsetArray[i])
                }
            }.offset(y: -40)
        }.onAppear() {
            startAnimation()
            Timer.scheduledTimer(withTimeInterval: (Constants.nextAnimationDuration * 13), repeats: true) { _ in
                startAnimation()
            }
        }
    }
    
    private func startAnimation() {
        let totalSize = (Constants.capsuleSize * 2) + Constants.spacing
        withAnimation(.easeInOut(duration: 0.5)) {
            capsuleViewSizeArray[2].width = Constants.capsuleSize
            capsuleViewOffsetArray[2].x = -30
        }
        
        withAnimation(.easeInOut(duration: 0.5).delay(0.3)) {
            capsuleViewSizeArray[1].height = totalSize
            capsuleViewOffsetArray[1].y = 30
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            withAnimation(.easeInOut(duration: 0.5)) {
                capsuleViewSizeArray[1].height = Constants.capsuleSize
                capsuleViewOffsetArray[1].y = 60
            }
            
            withAnimation(.easeInOut(duration: 0.5).delay(0.3)) {
                capsuleViewSizeArray[0].width = totalSize
                capsuleViewOffsetArray[0].x = 0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
            withAnimation(.easeInOut(duration: 0.5)) {
                capsuleViewSizeArray[0].width = Constants.capsuleSize
                capsuleViewOffsetArray[0].x = 30
            }
            
            withAnimation(.easeInOut(duration: 0.5).delay(0.3)) {
                capsuleViewSizeArray[2].height = totalSize
                capsuleViewOffsetArray[2].y = 30
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
            withAnimation(.easeInOut(duration: 0.5)) {
                capsuleViewSizeArray[2].height = Constants.capsuleSize
                capsuleViewOffsetArray[2].y = 0
            }
            
            withAnimation(.easeInOut(duration: 0.5).delay(0.3)) {
                capsuleViewSizeArray[1].width = totalSize
                capsuleViewOffsetArray[1].x = 0
            }
        }

        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {
            withAnimation(.easeInOut(duration: 0.5)) {
                capsuleViewSizeArray[1].width = Constants.capsuleSize
                capsuleViewOffsetArray[1].x = -30
            }
            
            withAnimation(.easeInOut(duration: 0.5).delay(0.3)) {
                capsuleViewSizeArray[0].height = totalSize
                capsuleViewOffsetArray[0].y = 30
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            withAnimation(.easeInOut(duration: 0.5)) {
                capsuleViewSizeArray[0].height = Constants.capsuleSize
                capsuleViewOffsetArray[0].y = 60
            }
            
            withAnimation(.easeInOut(duration: 0.5).delay(0.3)) {
                capsuleViewSizeArray[2].width = totalSize
                capsuleViewOffsetArray[2].x = 0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.8) {
            withAnimation(.easeInOut(duration: 0.5)) {
                capsuleViewSizeArray[2].width = Constants.capsuleSize
                capsuleViewOffsetArray[2].x = 30
            }
            
            withAnimation(.easeInOut(duration: 0.5).delay(0.3)) {
                capsuleViewSizeArray[1].height = totalSize
                capsuleViewOffsetArray[1].y = 30
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.6) {
            withAnimation(.easeInOut(duration: 0.5)) {
                capsuleViewSizeArray[1].height = Constants.capsuleSize
                capsuleViewOffsetArray[1].y = 0
            }
            
            withAnimation(.easeInOut(duration: 0.5).delay(0.3)) {
                capsuleViewSizeArray[0].width = totalSize
                capsuleViewOffsetArray[0].x = 0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.4) {
            withAnimation(.easeInOut(duration: 0.5)) {
                capsuleViewSizeArray[0].width = Constants.capsuleSize
                capsuleViewOffsetArray[0].x = -30
            }
            
            withAnimation(.easeInOut(duration: 0.5).delay(0.3)) {
                capsuleViewSizeArray[2].height = totalSize
                capsuleViewOffsetArray[2].y = 30
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 7.2) {
            withAnimation(.easeInOut(duration: 0.5)) {
                capsuleViewSizeArray[2].height = Constants.capsuleSize
                capsuleViewOffsetArray[2].y = 60
            }
            
            withAnimation(.easeInOut(duration: 0.5).delay(0.3)) {
                capsuleViewSizeArray[1].width = totalSize
                capsuleViewOffsetArray[1].x = 0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 8.0) {
            withAnimation(.easeInOut(duration: 0.5)) {
                capsuleViewSizeArray[1].width = Constants.capsuleSize
                capsuleViewOffsetArray[1].x = 30
            }
            
            withAnimation(.easeInOut(duration: 0.5).delay(0.3)) {
                capsuleViewSizeArray[0].height = totalSize
                capsuleViewOffsetArray[0].y = 30
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 8.8) {
            withAnimation(.easeInOut(duration: 0.5)) {
                capsuleViewSizeArray[0].height = Constants.capsuleSize
                capsuleViewOffsetArray[0].y = 0
            }
            
            withAnimation(.easeInOut(duration: 0.5).delay(0.3)) {
                capsuleViewSizeArray[2].width = totalSize
                capsuleViewOffsetArray[2].x = 0
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
