import SwiftUI
import MapKit

struct NilButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

struct MainPage: View {
    @State private var isForYouSelected = true
    @State private var showMenu = false
    @State private var showExpandedBlackScreen = true
    @State private var selectedTab = 0
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    @State private var trackingMode: MapUserTrackingMode = .follow
    @State private var isSwitchOn = true
    @State private var showEmojis = true //ui change
    
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: $trackingMode)
                .edgesIgnoringSafeArea(.all)
                .environment(\.colorScheme, .dark)
            VStack(spacing: 0) {
                HStack {
                    Spacer(minLength: 0)
                    circleButton
                }.padding(.horizontal, 16)
                .padding(.bottom, 25)
                HStack {
                    Spacer(minLength: 0)
                    toggleSection
                }.padding(.horizontal, 16)
                Spacer(minLength: 0)
            }.padding(.bottom, 90)
            .padding(.top, 16)
            

            if showExpandedBlackScreen {
                //expandedBlackScreenView
            } else if !showMenu { // Check if the SideMenu is not shown
                RoundedRectangle(cornerRadius: 50)
                    .fill(Color.black)
                    .frame(height: UIScreen.main.bounds.height / 8)
                    .offset(y: showMenu ? UIScreen.main.bounds.height : 370)
                    .overlay(
                        Text("  🫧  💫  👥            🍾  🥂  🎊  ")
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                            .offset(y: showMenu ? UIScreen.main.bounds.height : 360)
                    )
                    .animation(.easeOut(duration: 1), value: showMenu) // anichange
                    .onTapGesture {
                        withAnimation {
                            showExpandedBlackScreen = true
                            showEmojis = false
                        }
                    }
            }

            
            GeometryReader { _ in
                VStack {
                    Spacer()
                    if showExpandedBlackScreen{
                        ZStack{
                            mapModal
                        }
                    } else {
                        RoundedRectangle(cornerRadius: 50).fill(Color.black).frame(height: UIScreen.main.bounds.height / 8).offset(y:400).onTapGesture{withAnimation{showExpandedBlackScreen = true}}
                    }
                  //  mapModal
                }.padding(.horizontal, 0)
            }.ignoresSafeArea(.all)
//            
            if showMenu {
                SideMenu(showMenu: $showMenu, isSwitchOn: $isSwitchOn).transition(.move(edge: .trailing))
            }
        }
        .onTapGesture {
            withAnimation {
                if showExpandedBlackScreen {
                    showExpandedBlackScreen = false
                    showEmojis = true //ui change
                }
                if showMenu{
                    showMenu = false
                }
            }
        }
    }
    
    var mapModal: some View {
        VStack {
            RoundedRectangle(cornerRadius: 2.5)
                .frame(width: 40, height: 5, alignment: .center)
                .padding(.top, 7)
//            Image(systemName: "chevron.compact.down")
//                .font(.system(size: 30, weight: .medium, design: .default))
//                .foregroundColor(.gray)
//                .padding(.top, 16)
            HStack {
                Text("Friends")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(selectedTab == 0 ? .white : .gray)
                    .onTapGesture {
                        withAnimation {
                            selectedTab = 0
                        }
                    }
                Spacer()
                Text("Events")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(selectedTab == 1 ? .white : .gray)
                    .onTapGesture {
                        withAnimation {
                            selectedTab = 1
                        }
                    }
            }.frame(maxWidth: 250)
            .padding(.top, 10)
            TabView(selection: $selectedTab) {
                FriendsView().tag(0)
                EventsView().tag(1)
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        .frame(height: 650)
        .background(Material.thick)
        .cornerRadius(30)
        .transition(.move(edge: .bottom)).gesture(
            DragGesture().onEnded { value in
                if value.translation.width < 0 {
                    withAnimation {
                        selectedTab = 1
                    }
                } else if value.translation.width > 0 {
                    withAnimation {
                        selectedTab = 0
                    }
                }
            }
        ).onTapGesture {}
    }
        var expandedBlackScreenView: some View {
            VStack {
                HStack(spacing: 20) {
                    Text("Friends").font(.system(size: 22, weight: selectedTab == 0 ? .bold : .regular)).foregroundColor(selectedTab == 0 ? .white : .gray).padding().onTapGesture {
                        withAnimation {
                            selectedTab = 0
                        }
                    }
                    Spacer()
                    Text("Events").font(.system(size: 22, weight: selectedTab == 1 ? .bold : .regular)).foregroundColor(selectedTab == 1 ? .white : .gray).padding().onTapGesture {
                        withAnimation {
                            selectedTab = 1
                        }
                    }
                }.padding(.horizontal, 60)
                TabView(selection: $selectedTab) {
                    FriendsView().tag(0)
                    EventsView().tag(1)
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 3 / 4).background(Color.black).cornerRadius(50).transition(.move(edge: .bottom)).gesture(
                DragGesture().onEnded { value in
                    if value.translation.width < 0 {
                        withAnimation {
                            selectedTab = 1
                        }
                    } else if value.translation.width > 0 {
                        withAnimation {
                            selectedTab = 0
                        }
                    }
                }
            ).onTapGesture {}
        }
    
    var toggleSection: some View {
        HStack(spacing: 10) {
            VStack(alignment: .trailing, spacing: 0) {
                Text("All")
                    .font(.system(size: 13).bold())
                    .foregroundColor(isForYouSelected ? .white : .gray)
                Spacer(minLength: 0)
                Text("For You")
                    .font(.system(size: 13).bold())
                    .foregroundColor(isForYouSelected ? .gray : .white)
            }.shadow(color: .black.opacity(1), radius: 20, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/) // TODO: Add shadows
            .padding(.vertical, 12)
            
            Button(action: {
                withAnimation {
                    isForYouSelected.toggle()
                }
            }, label: {
                ZStack {
                    Rectangle()
                        .background(Material.regular)
                        .cornerRadius(50)
                    Circle()
                        .fill(Color.white)
                        .frame(width: 44 - 3 * 2, height: 44 - 3 * 2)
                        .offset(x: 0, y: isForYouSelected ?  -23 : 23)
                }
            }).frame(width: 44)
            .buttonStyle(NilButtonStyle())
        }.frame(height: 90)
    }
        
        var circleButton: some View {
            Button(action: {
                withAnimation {
                    showMenu = true
                }
            }) {
                Circle().fill(Color.white).frame(width: 50, height: 50)
            }
        }
    }
    
    struct FriendsView: View {
        var body: some View {
            VStack {
                Spacer()
                Button(action: {}) {
                    HStack(spacing: 8) {
                        Image(systemName: "plus")
                        Text("Add Friends")
                    }.font(.system(size: 17, weight: .bold))
                    .frame(width: 200, height: 54)
                    .foregroundColor(.black).background(Color.white)
                    .cornerRadius(10)
                }
            }
        }
    }
    
    struct EventsView: View {
        var body: some View {
            VStack {
                Spacer()
                Button(action: {}) {
                    HStack(spacing: 8) {
                        Image(systemName: "plus")
                        Text("Add Events")
                    }.font(.system(size: 17, weight: .bold))
                    .frame(width: 200, height: 54)
                    .foregroundColor(.black).background(Color.white)
                    .cornerRadius(10)
                }
            }
        }
    }
    
    struct SideMenu: View {
        @Binding var showMenu: Bool
        @Binding var isSwitchOn: Bool
        
        var body: some View {
            ZStack(alignment: .topTrailing) {
                Color.black.frame(width: UIScreen.main.bounds.width * 3 / 4, height: UIScreen.main.bounds.height + 10).cornerRadius(35).offset(y:-5).overlay(
                    VStack(alignment: .leading) {
                        Circle().fill(Color.white.opacity(0.5)).frame(width: 75, height: 75).padding(.top, 20).offset(y:75)
                        Group{
                            Text("username").font(.system(size: 20).bold()).foregroundColor(.white).offset(x: 120, y:-20).padding(.top, 10)
                            Text("near this location").font(.system(size: 17).bold()).foregroundColor(.white).offset(x: 120, y:-20).padding(.top, 5)
                            Text("Location:").font(.system(size: 17).bold()).foregroundColor(.white).offset(y: 80)
                        }
                        VStack {
                            Rectangle().foregroundColor(.clear).frame(width: 100, height: 50).background(Color.white.opacity(0.6)).cornerRadius(50).offset(x: 150, y: -125).offset(y: 130)
                            HStack{
                                Text("On").font(.system(size: 13).bold()).foregroundColor(isSwitchOn ? .white : .gray).offset(x: -6)
                                Text("Off").font(.system(size: 13).bold()).foregroundColor(isSwitchOn ? .gray : .white).offset(x: 6)
                            }.scaleEffect(0.75).offset(x:150, y: -125).offset(y: 130)
                        }.padding(.top, 20)
                        Button(action: {
                            withAnimation {
                                isSwitchOn.toggle()
                            }
                        }) {
                            Circle().fill(Color.white).frame(width: 45, height: 45)
                        }.offset(x: isSwitchOn ? -25 : 25).offset(x:175, y: -200).offset(y: 130)
                        Button("Change") {}.foregroundColor(.black).padding().background(Color.white).cornerRadius(50).padding(.top, 10).scaleEffect(0.8).offset(x: -10, y: -310)
                            .scaleEffect(0.75)
                        Button("Sign Out") {}.font(.system(size: 24).bold()).foregroundColor(.black).padding().background(Color.white).cornerRadius(50).padding(.top, 10).scaleEffect(1).offset(x: 75, y: 210)
                            .scaleEffect(0.75)
                            .offset(y: 125) //uichange
                        Text("Your Collages 📷:").font(.system(size: 20).bold()).foregroundColor(.white).padding(.top, 20).offset(x: 25, y: -280).offset(y: 125)
                        HStack {
                            Image("PNG image 1").resizable().scaledToFit().frame(width: 100, height: 100).cornerRadius(15).blur(radius: 1.5)
                            Image("PNG image 2").resizable().scaledToFit().frame(width: 100, height: 100).cornerRadius(15).blur(radius: 1.5)
                        }.scaleEffect(0.75).offset(x: 27.5, y: -270).padding(.top, 20)                      .offset(y: 125) //uichange
                        HStack {
                            Image("PNG image 3").resizable().scaledToFit().frame(width: 100, height: 100).cornerRadius(15).blur(radius: 1.5)
                            Image("PNG image").resizable().scaledToFit().frame(width: 100, height: 100).cornerRadius(15).blur(radius: 1.5)
                        }.scaleEffect(0.75).offset(x: 27.5, y: -270).padding(.top, 10)                            .offset(y: 125).overlay(
                            //
                            VStack {
                                Image(systemName: "lock.fill").font(.title).foregroundColor(.white)
                                Text("coming soon ...").font(.subheadline).foregroundColor(.white)
                            }.offset(x: 27.5, y: -325).offset(y: 125)
                        )
                        Spacer()
                    }.padding(), alignment: .topLeading
                )
                GeometryReader { geometry in
                    Color.clear.contentShape(Rectangle()).onTapGesture {
                        withAnimation {
                            showMenu = false
                        }
                    }.frame(width: geometry.size.width / 4, height: geometry.size.height)
                }
            }
        }
    }
    
    struct MainPage_Previews: PreviewProvider {
        static var previews: some View {
            MainPage()
        }
    }
