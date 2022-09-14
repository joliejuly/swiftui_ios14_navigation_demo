
import SwiftUI

/// Главный вью навигации
struct MainNavigationView<Content: View>: View {
    private let content: Content

    var body: some View {
        NavigationView {
            content
                .navigationBarHidden(true)
                .ignoresSafeArea(.container, edges: .vertical)
        }
        .navigationViewStyle(.stack)
    }

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
}

struct MainNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MainNavigationView {
            EmptyView()
        }
    }
}
