import SwiftUI

struct LandingPage: View {
    @State private var isExpanded = false
    @State private var currentTextIndex = 0
    let texts = [
        "checking what your friends are up to...",
        "finding the hottest parties near you...",
        "making plans for tonight..."
    ]

    var body: some View {
        ZStack {
            ZStack {
                Circle()
                    .frame(width: isExpanded ? 12 : 24, height: isExpanded ? 12 : 24)
                    .foregroundColor(.white)
                    .offset(x: isExpanded ? 0 : -24, y: isExpanded ? -135 : -159)
                    .scaleEffect(0.65) // ui change

                Circle()
                    .foregroundColor(.white)
                    .frame(width: isExpanded ? 12 : 24, height: isExpanded ? 12 : 24)
                    .offset(x: isExpanded ? 0 : 24, y: isExpanded ? -135 : -159) // Adjusted Y offset
                    .scaleEffect(0.65) // ui change
                Circle()
                    .foregroundColor(.white)
                    .frame(width: isExpanded ? 12 : 24, height: isExpanded ? 12 : 24)
                    .offset(x: isExpanded ? 0 : -24, y: isExpanded ? -135 : -109)
                    .scaleEffect(0.65) // ui change
                Circle()
                    .foregroundColor(.white)
                    .frame(width: isExpanded ? 12 : 24, height: isExpanded ? 12 : 24)
                    .offset(x: isExpanded ? 0 : 24, y: isExpanded ? -135 : -109)
                    .scaleEffect(0.65) // ui change
            }
            .frame(width: isExpanded ? 50 : 100, height: isExpanded ? 50 : 100)
            .background(Color.black)
            .offset(x: 0, y: 278)
            
            Text("⚡️")
                .font(.system(size: 88)) // ui change
                .foregroundColor(.white)
                .offset(x: 0, y: -170)
            
            Text("Spark")
                .font(.system(size: 55, weight: .bold)) // ui change
                .foregroundColor(.white)
                .offset(x: 0, y: -45)
            Text(texts[currentTextIndex])
                .font(.system(size: 17)) // ui change
                .foregroundColor(.white)
                .offset(x: 0, y: 275)
        }
        .frame(width: 430, height: 932)
        .background(Color.black)
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                isExpanded = true
            }
            
            Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { timer in
                withAnimation {
                    currentTextIndex = (currentTextIndex + 1) % texts.count
                }
            }
        }
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
