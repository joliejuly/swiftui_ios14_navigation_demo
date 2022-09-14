//
//  NavigationStorage.swift
//  NavigationDemo
//
//  Created by Юлия Никитина on 14.09.2022.
//

import SwiftUI

/// Хранилище стека навигации
final class NavigationStorage: ObservableObject {
    static let shared = NavigationStorage()

    /// Хранилище активных navigation links
    @Published var pathItems: [NavigationPathItem] = []

    /// Добавление нового пути навигации
    /// - Parameters:
    ///   - isActive: Флаг привязки, что данный экран открыт
    ///   - id: Идентификатор записи
    ///   - title: Название  экрана
    func addItem(isActive: Binding<Bool>, id: String, title: String) {
        DispatchQueue.main.async {
            guard !self.pathItems.contains(where: { $0.id == id }) else { return }
            let item = NavigationPathItem(isActive: isActive, id: id, title: title)
            self.pathItems.append(item)
        }
    }

    /// Переход к экрану по id
    /// - Parameters:
    ///   - id: Идентификатор экрана
    func popTo(id: String) {
        guard let index = pathItems.firstIndex(where: { $0.id == id }) else { return }
        // Отключаем линк перед выбранным экраном
        pathItems[index + 1].isActive.wrappedValue = false
        pathItems = Array(pathItems[0 ... index])
    }
    
    /// Добавление главного экрана в стек хлебных крошек
    func addMainScreenPathItem() {
        addItem(isActive: .constant(true), id: String(describing: ContentView.self), title: "Home")
    }
}
