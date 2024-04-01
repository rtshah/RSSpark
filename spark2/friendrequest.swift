import SwiftUI
import MapKit

struct FriendRequest: View {
    private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    var body: some View {
        ZStack {
            Map(coordinateRegion: .constant(region), interactionModes: [])
                .edgesIgnoringSafeArea(.all)
                .environment(\.colorScheme, .dark)
                .disabled(true) // Disable interaction with the map

            // White rectangle with the text and buttons
            ZStack {
                RoundedRectangle(cornerRadius: 50) // 50 degree rounded edges
                    .fill(Color.white)
                    .frame(width: 350, height: 350)
                    .overlay(
                        VStack {
                            Text("New Friends?")
                                .font(.title)                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .padding(.top, -80)
                            Text("Name")
                                .font(.largeTitle)
                                .bold()
                                .padding(.bottom, 24)
                                .offset(y:-20)

                            HStack(spacing: 45) {
                                Button("Accept") {
                                }
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .bold))
                                .padding()
                                .scaleEffect(0.8)
                                .background(Color.black)
                                .cornerRadius(10)

                                Button("Deny") {
                                    // Action for Deny button
                                }
                                .foregroundColor(.white)
                                .scaleEffect(0.8)
                                .font(.system(size: 22, weight: .bold))
                                .padding()
                                .background(Color.black)
                                .cornerRadius(10)
                            }
                        }
                        .padding(.top, 20)
                    )
            }
        }
    }
}

struct FriendRequest_Previews: PreviewProvider {
    static var previews: some View {
        FriendRequest()
    }
}
