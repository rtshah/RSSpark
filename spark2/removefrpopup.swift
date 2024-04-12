import SwiftUI
import MapKit

struct RemoveFrPopUp: View {
    private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    var body: some View {
        ZStack {
            Map(coordinateRegion: .constant(region), interactionModes: [])
                .edgesIgnoringSafeArea(.all)
                .environment(\.colorScheme, .dark)
                .disabled(true)
            ZStack {
                RoundedRectangle(cornerRadius: 50)
                    .fill(Color.black)
                    .frame(width: 350, height: 350)
                    .overlay(
                        VStack(spacing:20){
                            Text("Remove Name")
                                .font(.title)                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                            Text("as a friend")
                                .font(.title)                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)

Spacer()
                            HStack(spacing: 45) {
                                Button("Accept") {
                                }
                                .foregroundColor(.black)
                                .font(.system(size: 22, weight: .bold))
                                .padding()
                                .scaleEffect(0.8)
                                .background(Color.white)
                                .cornerRadius(10)

                                Button("Deny") {
                                }
                                .foregroundColor(.white)
                                .scaleEffect(0.8)
                                .font(.system(size: 22, weight: .bold))
                                .padding()
                                .background(Color.black)
                                .cornerRadius(10)
                            }.padding(.bottom, 48)
                        }
                            .padding(.top, 48)
                    )
            }
        }
    }
}

struct RemoveFrPopUp_Previews: PreviewProvider {
    static var previews: some View {
        RemoveFrPopUp()
    }
}
