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
            NavigationView {
                ApplicationSwitcher(userStateViewModel: userStateViewModel) // Pass the userStateViewModel here
            }
            .navigationViewStyle(.stack)
            .environmentObject(userStateViewModel) // Remove this line if not needed elsewhere
            .onAppear() {
                userStateViewModel.checkAuth()
            }
        }
    }
}

struct ApplicationSwitcher: View {
    @ObservedObject var userStateViewModel: UserStateViewModel

    var body: some View {
        if userStateViewModel.isLoggedIn {
            MainNavigation()
        } else {
            if userStateViewModel.isLoginView {
                LoginView()
            } else {
                RegisterView()
            }
        }
    }
}

