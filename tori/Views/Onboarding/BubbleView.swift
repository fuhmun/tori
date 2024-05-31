import SwiftUI

struct BubbleView: View {
    @Binding var bubble: Bubble
    @State private var isPopping = false
    let size: CGFloat = 85

    var body: some View {
        Circle()
            .fill(bubble.color)
            .frame(width: size, height: size)
            .scaleEffect(isPopping ? 1.5 : 1.0)
            .position(bubble.position)
            .animation(.easeInOut(duration: 0.5), value: bubble.position)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.2)) {
                    isPopping = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        if bubble.isPressed {
                            bubble.direction = CGSize(width: CGFloat.random(in: -1...1), height: CGFloat.random(in: -1...1))
                        } else {
                            bubble.direction = CGSize.zero
                        }
                        bubble.color = bubble.isPressed ? .blue : .red
                        bubble.isPressed.toggle()
                        isPopping = false
                    }
                }
            }
    }
}




//#Preview {
//    BubbleView(bubble: Bubble)
//}
