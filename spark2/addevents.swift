/*import SwiftUI

extension DateFormatter {
    static let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter
    }()
}

struct AddEvents: View {
    @State private var eventName: String = ""
    @State private var eventDescription: String = ""
    @State private var location: String = ""
    @State private var selection: String?
    @State private var everyoneText: String = "Everyone"
    @State private var friendsAndMutualsText: String = "Friends and Mutuals Only"
    @State private var friendsOnlyText: String = "Friends Only"
    
    @ObservedObject var viewModel = EventDateTimeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .trailing) {
                    
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.horizontal, 48)
                    
                    VStack(alignment: .leading, spacing: 38) {
                        Text("Add Event")
                            .font(.system(size: 22))
                            .bold()
                            .foregroundColor(.white)
                            .padding(.horizontal, 48)
                        TextField("Event Name", text: $eventName)
                            .padding()
                            .frame(width: 205, height: 38)
                            .background(Color.gray)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 48)
                        
                        TextField("Theme, description, and anything else.!", text: $eventDescription)
                            .padding()
                            .frame(width: 205, height: 76)
                            .background(Color.gray)
                            .cornerRadius(10)
                            .padding(.horizontal, 48)
                            .foregroundColor(.white)
                        
                        TextField("Location", text: $location)
                            .padding()
                            .frame(width: 205, height: 38)
                            .background(Color.gray)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 48)
                        
                        if viewModel.timeHasBeenSet {
                            VStack {
                                Text("Starts at \(viewModel.startTime, formatter: DateFormatter.timeFormatter)")
                                    .foregroundColor(.white)
                                Button("Change") {
                                    viewModel.isShowingSetTimeView = true
                                }
                                .font(.system(size: 12))
                                .foregroundColor(.blue)
                                .padding(.horizontal, 48)
                            }
                        } else {
                            Button("Set Time") {
                                viewModel.isShowingSetTimeView = true
                            }
                            .foregroundColor(.black)
                            .bold()
                            .frame(width: 150, height: 50)
                            .background(Color.white)
                            .cornerRadius(30)
                            .padding(.horizontal, 48)
                        }
                        
                        
                        Text("Who's coming?")
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(.white)
                            .padding(.horizontal, 48)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Button(action: {
                                selection = "Everyone"
                                everyoneText = "Let's Rage 🎉"
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    everyoneText = "Everyone"
                                }
                            }) {
                                HStack {
                                    Image(systemName: selection == "Everyone" ? "largecircle.fill.circle" : "circle")
                                        .foregroundColor(.white)
                                    Text(everyoneText)
                                        .font(.system(size: 17))
                                
                                        .foregroundColor(.white)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 48)
                            
                            Button(action: {
                                selection = "Friends and Mutuals Only"
                                friendsAndMutualsText = "Kickback 🤗"
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    friendsAndMutualsText = "Friends and Mutuals Only"
                                }
                            }) {
                                HStack {
                                    Image(systemName: selection == "Friends and Mutuals Only" ? "largecircle.fill.circle" : "circle")
                                        .foregroundColor(.white)
                                    Text(friendsAndMutualsText)
                                        .font(.system(size: 17))
                                        .foregroundColor(.white)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 48)

                            Button(action: {
                                selection = "Friends Only"
                                friendsOnlyText = "Small hangout 😄"
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    friendsOnlyText = "Friends Only"
                                }
                            }) {
                                HStack {
                                    Image(systemName: selection == "Friends Only" ? "largecircle.fill.circle" : "circle")
                                        .foregroundColor(.white)
                                    Text(friendsOnlyText)
                                        .font(.system(size: 17))
                                        .foregroundColor(.white)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 48)

                        }
                        
                        VStack(alignment: .center, spacing: 38){
                            Button(action: {
                            }) {
                                Text("Done")
                                    .font(.system(size: 17))
                                    .bold()
                                    .foregroundColor(.black)
                                    .frame(width: 150, height: 50)
                                    .background(Color.white)
                                    .cornerRadius(30)
                                    .padding(.horizontal, 48)
                                
                            }
                        }
                    }
                }
            }
            .frame(width: 430, height: 932)
            .background(.black)
            .navigationBarHidden(true)
        }
        .sheet(isPresented: $viewModel.isShowingSetTimeView) {
            SetTime(viewModel: viewModel)
        }
        
    }
}

struct AddEvents_Previews: PreviewProvider {
    static var previews: some View {
        AddEvents()
    }
}
*/
