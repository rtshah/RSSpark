import SwiftUI

struct AddFrTwo: View {
    // Gesture state to detect swipe
    @GestureState private var swipeGesture = false

    var body: some View {
        ZStack {
            Text("Send")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white) // Text color changed to white for dark mode
                .offset(x: 0, y: -330)
                .offset(y: 25)
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 280, height: 75)
                .background(Color.white) // Adjusted for dark mode visibility
                .cornerRadius(100)
                .offset(x: 0, y: -250)
                .offset(y: 25)
            
            Text("a friend request")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white) // Text color changed to white for dark mode
                .offset(x: 0, y: -170)
                .offset(y: 25)
            
            
            // "Done" (Accept) Button
            Button(action: {
                print("Accept tapped") // Define the action for the "Done" (Accept) button here
            }) {
                ZStack {
                    Rectangle()
                        .frame(width: 250, height: 80)
                        .cornerRadius(100)
                        .foregroundColor(.white) // Button color changed to white for dark mode
                    
                    Text("Send")
                        .font(.title)
                        .foregroundColor(.black) // Text color inside the button kept black for contrast
                }
            }
            .scaleEffect(0.75)
            .offset(x: 0, y: 320)
            
            // X out Button
            Button(action: {
                print("X Button tapped") // Action for button tap
            }) {
                ZStack {
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.red.opacity(0.44))
                        .offset(y: 10)
                    
                    Text("X")
                        .font(.system(size: 16, weight: .bold)) // Default SwiftUI font in bold
                        .foregroundColor(.black) // Text color inside the button kept black for contrast
                        .offset(y: 10)
                }
            }
            .offset(x: 130, y: -375) // Adjust position as needed
            
            // Detecting swipe gesture
            .gesture(
                DragGesture(minimumDistance: 50, coordinateSpace: .local)
                    .updating($swipeGesture) { value, state, transaction in
                        if value.startLocation.x < value.location.x {
                            state = true
                            print("Swipe detected - triggering X button action")
                        }
                    }
            )
        }
        .frame(width: 430, height: 932)
        .background(.black) // Background color set to black for dark mode
    }
}

struct AddFrTwo_Previews: PreviewProvider {
    static var previews: some View {
        AddFrTwo()
    }
}
