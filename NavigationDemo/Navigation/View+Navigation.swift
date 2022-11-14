import SwiftUI

private extension View {
    /// Дополнительный идентификатор для навигации с именем, отличным от id
    /// Из-за static method dispatch в расширениях к протоколам свойство с именем id имеет приоритет над одноименным свойством во вью
    var navigationID: String {
        String(describing: Self.self)
    }
}

/// Модификатор навигации
struct NavigationModifier<Destination: View>: ViewModifier {
    let destination: Destination?
    let isActive: Binding<Bool>

    init(id: String? = nil, title: String, destination: Destination?, isActive: Binding<Bool>) {
        self.destination = destination
        self.isActive = isActive

        guard let destination = destination, isActive.wrappedValue == true else { return }
        let identifier = id ?? destination.navigationID

        NavigationStorage.shared.addItem(isPresented: isActive, id: identifier, title: title)
    }

    func body(content: Content) -> some View {
        content
            .background(
                NavigationLink(
                    destination: destination,
                    isActive: isActive
                ) {
                    EmptyView()
                }
                .hidden()
            )
    }
}

extension View {
    func navigationLink<Destination: View>(
        id: String? = nil,
        title: String,
        destination: Destination?,
        isActive: Binding<Bool>
    ) -> some View {
        modifier(NavigationModifier(id: id, title: title, destination: destination, isActive: isActive))
    }
}
