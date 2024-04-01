import SwiftUI

struct ClickEvent: View {
    @State private var isLiked = false
    @State private var isShared = false
    @State private var isBookmarked = false

    var body: some View {
        ZStack {
            ZStack {
                Text("Event Name")
                    .font(.largeTitle)
                    .foregroundColor(.white) // Text color changed to white
                    .offset(x: -35, y: -280)
                
                Text("invite status")
                    .font(.title)
                    .foregroundColor(.white) // Text color changed to white
                    .offset(x: -50, y: -240)
                
                Text("description")
                    .font(.title)
                    .foregroundColor(.white) // Text color changed to white
                    .offset(x: -50, y: -200)
                
                Circle()
                    .foregroundColor(.clear)
                    .frame(width: 150, height: 150)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .offset(x: 0, y: -50)

                Text("if >0 friends liked display profiles of mutuals")
                    .font(.system(size: 17)) // Default SwiftUI font in bold
                    .foregroundColor(.white) // Text color changed to white
                    .padding() // Added padding around the text
                    .offset(x: 0, y: 200)
                
                // Social Buttons Container
                HStack(spacing: 30) {
                    // Like Button with adjusted offset
                    VStack {
                        Button(action: {
                            withAnimation {
                                self.isLiked.toggle()
                            }
                        }) {
                            Image(systemName: isLiked ? "heart.fill" : "heart")
                                .font(.system(size: 24 * 1.5))
                                .scaleEffect(isLiked ? 1.5 : 1)
                                .foregroundColor(isLiked ? .red : .white) // Button color changed to white
                        }
                    }
                    .offset(x: 0,y: -200)
                    

                    // Share Button with adjusted offset
                    VStack {
                        Button(action: {
                            withAnimation {
                                self.isShared.toggle()
                            }
                        }) {
                            Image(systemName: "square.and.arrow.up")
                                .font(.system(size: 24 * 1.5))
                                .scaleEffect(isShared ? 1.5 : 1)
                                .foregroundColor(.white) // Button color changed to white
                        }
                    }
                    .offset(x: 0, y: -210) // Adjusted offset for Share Button

                }
                .offset(x: 0, y: 320) // Adjust the vertical position of the buttons container
                
                // "Done" button inside a light yellow box, scaled up
                Button(action: {
                    print("Done button tapped") // Define the action for your button here
                }) {
                    Text("Done")
                        .foregroundColor(.black) // Set the text color to white
                        .font(.title)
                        .padding() // Adjust padding if needed to accommodate the larger size
                        .background(Color.white)
                        .cornerRadius(10)
                        .scaleEffect(0.8)
                }
                .offset(x: 0, y: 280) // You might need to adjust this offset based on the new size
            }
            .frame(width: 300, height: 700)
            .background(.black)
            .cornerRadius(50)
        }
        .frame(width: 430, height: 932)
        .background(.white)
    }
}

struct ClickEvent_Previews: PreviewProvider {
    static var previews: some View {
        ClickEvent()
    }
}
