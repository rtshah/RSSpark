import SwiftUI

struct BubbleIcon: View {
    var body: some View {
        ZStack {
            TextBubbleShape()
                .fill(Color.white.opacity(0.75))
                .frame(width: 200, height: 150)
                .shadow(radius: 3)
            
            VStack(spacing: 10) {
                Text("Event Name")
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)
                
                Text("Location")
                    .font(.headline)
                    .foregroundColor(.black)
                
                Button(action: {
                 
                }) {
                    Text("See more info")
                        .foregroundColor(.white)
                        .padding(7.5)
                        .background(Color.black)
                        .cornerRadius(10)
                }
                Text(" bitmojis ICONS below only")
            }
            .offset(y:-25)
        }
    }
}

struct TextBubbleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let bubbleRect = rect.insetBy(dx: -20, dy: -40)
        let cornerRadius: CGFloat = 35
        
        let tailWidth: CGFloat = 20
        let tailHeight: CGFloat = 20
        let tailOrigin = CGPoint(x: bubbleRect.midX - tailWidth / 2, y: bubbleRect.maxY)
        
        path.addRoundedRect(in: bubbleRect, cornerSize: CGSize(width: cornerRadius, height: cornerRadius))
        
        path.move(to: tailOrigin)
        path.addLine(to: CGPoint(x: tailOrigin.x + tailWidth / 2, y: tailOrigin.y + tailHeight))
        path.addLine(to: CGPoint(x: tailOrigin.x + tailWidth, y: tailOrigin.y))
        path.closeSubpath()

        return path
    }
}

// Preview Provider to see the component in SwiftUI Preview
struct BubbleIcon_Previews: PreviewProvider {
    static var previews: some View {
        BubbleIcon()
    }
}
