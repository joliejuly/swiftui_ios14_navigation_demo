//
//  NavigationStorage.swift
//  NavigationDemo
//
//  Created by Юлия Никитина on 14.09.2022.
//

import SwiftUI

extension View {
    static var id: String {
        String(describing: self)
    }
}

/// Хранилище стека навигации
final class NavigationStorage: ObservableObject {
    static let shared = NavigationStorage()

    /// Хранилище активных navigation links
    @Published var pathItems: [NavigationPathItem] = []
    
    
    /// Добавление нового пути навигации
    /// - Parameters:
    ///   - isPresented: Флаг привязки, что данный экран открыт
    ///   - id: Идентификатор записи
    ///   - title: Название  экрана
    func addItem(isPresented: Binding<Bool>, id: String, title: String) {
        DispatchQueue.main.async {
            guard !self.pathItems.contains(where: { $0.id == id }) else { return }
            let item = NavigationPathItem(isPresented: isPresented, id: id, title: title)
            self.pathItems.append(item)
        }
    }

    /// Переход к экрану по id
    /// - Parameters:
    ///   - id: Идентификатор экрана
    func popTo(id: String) {
        guard let index = pathItems.firstIndex(where: { $0.id == id }) else { return }
        for (idx, item) in pathItems.enumerated() where idx > index {
            item.isPresented.wrappedValue = false
        }
        pathItems = Array(pathItems[0 ... index])
    }
    
    /// Добавление главного экрана в стек хлебных крошек
    func addMainScreenPathItem() {
        addItem(isPresented: .constant(true), id: String(describing: ContentView.self), title: "Home")
    }
}
