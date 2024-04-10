import SwiftUI
import CoreLocation

struct LocationQuestion2: View {
    @State private var yOffset: CGFloat = 600
    @State private var isOverlayActive: Bool = false
    @State private var isAllowButtonPressed: Bool = false
    let locationManager = CLLocationManager()

    var body: some View {
        ZStack {
            if isOverlayActive {
                Color.black.opacity(0.001)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            yOffset = 600
                            isOverlayActive = false
                        }
                    }
            }

            Button(action: {
                withAnimation(.easeInOut(duration: 0.2)) {
                    isAllowButtonPressed = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        isAllowButtonPressed = false
                        requestLocationPermission()
                    }
                }
            }) {
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 375, height: 58)
                        .background(Color(red: 0, green: 0.57, blue: 0.80))
                        .cornerRadius(100)
                        .scaleEffect(isAllowButtonPressed ? 0.95 : 1.0)
                    
                    Text("Allow")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .scaleEffect(isAllowButtonPressed ? 0.95 : 1.0)
                }
            }
            .offset(x: 0, y: 250)
            .animation(.easeInOut(duration: 0.2), value: isAllowButtonPressed)

            VStack(){
                Text("So, are you from around here?")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("Set your location to see your friends and events nearby. Don't miss out on what's happening otherwise.")
                    .font(.system(size: 17))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                
                Image("gps_4120467")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
            }
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 400, height: 554)
                .background(Color.white)
                .cornerRadius(60)
                .offset(x: 0, y: yOffset)
                .animation(.easeOut(duration: 0.5), value: yOffset)
                .onTapGesture {
                    withAnimation {
                        yOffset = 100
                        isOverlayActive = true
                    }
                }

            Text("How is my location used?")
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(.black)
                .offset(x: 0, y: yOffset - 235)
                .animation(.easeOut(duration: 0.5), value: yOffset)

            Text("Don't worry —— ")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.black)
                .offset(x: 0, y: yOffset - 40)
                .animation(.easeOut(duration: 0.5), value: yOffset)

            Text("Your location helps us show friends and events nearby. Your location is only shown to approved friends, never publicly shared.")
                .font(.system(size: 18))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(40)
                .offset(x: 0, y: yOffset + 20)
                .animation(.easeOut(duration: 0.5), value: yOffset)
        }
        .frame(width: 430, height: 932)
        .background(Color.black)
    }

    private func requestLocationPermission() {
        locationManager.requestWhenInUseAuthorization()
    }
}

struct LocationQuestion2_Previews: PreviewProvider {
    static var previews: some View {
        LocationQuestion2()
    }
}
