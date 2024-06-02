//
//  OnBoardingg.swift
//  tori
//
//  Created by Fahad Munawar on 5/24/24.
//

import SwiftUI

struct OnBoarding6: View {
    @State private var bubbles: [Bubble] = (0..<10).map { _ in
        Bubble(
            position: CGPoint(x: CGFloat.random(in: 50...350), y: CGFloat.random(in: 100...700)),
            direction: CGSize(width: CGFloat.random(in: -1...1), height: CGFloat.random(in: -1...1))
        )
    }
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    @State private var backgroundColor = Color.white

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("Background")

                ForEach($bubbles) { $bubble in
                    BubbleView(bubble: $bubble)
                }
            }
            .onReceive(timer) { _ in
                updateBubblePositions(in: geometry.size)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }

    private func updateBubblePositions(in size: CGSize) {
        for index in bubbles.indices {
            guard bubbles[index].isPressed == false else { continue }
            var newPosition = CGPoint(
                x: bubbles[index].position.x + bubbles[index].direction.width,
                y: bubbles[index].position.y + bubbles[index].direction.height
            )

          
            if newPosition.x < 0 || newPosition.x > size.width {
                bubbles[index].direction.width *= -1
                newPosition.x = min(max(newPosition.x, 0), size.width)
            }
            if newPosition.y < 0 || newPosition.y > size.height {
                bubbles[index].direction.height *= -1
                newPosition.y = min(max(newPosition.y, 0), size.height)
            }

           
            for otherIndex in bubbles.indices where otherIndex != index && bubbles[otherIndex].isPressed == false {
                let otherBubble = bubbles[otherIndex]
                let distance = hypot(newPosition.x - otherBubble.position.x, newPosition.y - otherBubble.position.y)
                if distance < size.width / 15 {
                    let angle = atan2(newPosition.y - otherBubble.position.y, newPosition.x - otherBubble.position.x)
                    bubbles[index].direction = CGSize(width: cos(angle), height: sin(angle))
                    bubbles[otherIndex].direction = CGSize(width: -cos(angle), height: -sin(angle))
                }
            }

            bubbles[index].position = newPosition
        }
    }
}



#Preview {
    OnBoarding6()
}
