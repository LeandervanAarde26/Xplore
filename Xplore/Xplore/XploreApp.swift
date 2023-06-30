import SwiftUI
import FirebaseCore
import Firebase

@main
struct XploreApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    @StateObject var userStateViewModel = UserStateViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ApplicationSwitcher()
            }
            .navigationViewStyle(.stack)
            .environmentObject(userStateViewModel)
        }
    }
}

struct ApplicationSwitcher: View {
    
    @EnvironmentObject var userStateViewModel: UserStateViewModel
    
    var body: some View {
        if (userStateViewModel.isLoggedIn) {
            MainNavigation()
        } else {
            LoginView()
        }
    }
}

