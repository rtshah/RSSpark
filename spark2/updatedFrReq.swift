import SwiftUI
import MapKit

struct updatedFrReq: View {
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
                Rectangle()
                      .frame(width: 375, height: 405)
                     .background(.black)            .cornerRadius(25).overlay(
                        VStack(spacing:45){
                            Text("New Friend?")
                                .font(.system(size: 22))
                                .bold()
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                            Text("Rahul")
                                .font(.system(size: 22))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)


                            HStack(spacing: 45) {
                                Button("Accept") {
                                }
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .bold))
                                .padding()
                                .scaleEffect(0.8)
                                .background(Color.white)
                                .cornerRadius(10)

                                Button("Deny") {
                                }
                                .foregroundColor(.white)
                                .scaleEffect(0.8)
                                .font(.system(size: 17, weight: .bold))
                                .padding()
                                .background(Color.black)
                                .cornerRadius(10)
                            }
                        }
                    )
            }
        }
    }
}

struct updatedFrReq_Previews: PreviewProvider {
    static var previews: some View {
        updatedFrReq()
    }
}
