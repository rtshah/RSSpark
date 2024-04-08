import SwiftUI

struct AddFrTwo: View {
    
    @GestureState private var swipeGesture = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 80){
                VStack(spacing: 25){
                    Text("Send")
                        .font(.system(size: 17))
                        .foregroundColor(.white)
                    Text("Rahul")
                        .font(.system(size: 22))
                        .bold()
                        .foregroundColor(.white)
                    
                    Text("a friend request")
                        .font(.system(size: 17))
                        .foregroundColor(.white)
                }

                    Text("Keep in mind your friends can see what you're up to - this is for that group chat and those friends.")
                        .font(.system(size: 17))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 64)
                    
                    Button(action: {}) {
                        Text("Continue")
                            .font(.system(size: 17, weight: .bold))
                            .foregroundColor(.black)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(.white)
                    .cornerRadius(25)
                    .padding(.top, 25)
                    .padding(.horizontal, 64)
                }
        }
        .frame(width: 430, height: 932)
        .background(.black)
        .padding(.horizontal, 64)
    }
}

struct AddFrTwo_Previews: PreviewProvider {
    static var previews: some View {
        AddFrTwo()
    }
}
