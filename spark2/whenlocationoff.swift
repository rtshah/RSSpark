import SwiftUI
import MapKit

struct WhenLocationOff: View {
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
                    .fill(Color.white)
                    .frame(width: 350, height: 350)
                    .overlay(
                        VStack {
                            Text("Features remain locked until location enabled")
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 20)
                                .padding([.leading, .trailing], 20)

                            Image(systemName: "lock.fill")
                                .font(.system(size: 50))
                                .foregroundColor(.black)

                            Button(action: {
                            }) {
                                Text("Enable location sharing")
                                    .font(.system(size: 20))
                                    .bold()
                                    .foregroundColor(.black)
                                    .padding()
                                    .background(Color.blue.opacity(0.3))
                                    .cornerRadius(10)
                            }
                            .padding(.top, 20)
                        }
                    )
            }
        }
    }
}

struct WhenLocationOff_Previews: PreviewProvider {
    static var previews: some View {
        WhenLocationOff()
    }
}
