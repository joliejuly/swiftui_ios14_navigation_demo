//
//  NavigationPathItem.swift
//  NavigationDemo
//
//  Created by Юлия Никитина on 14.09.2022.
//

import SwiftUI

/// Информация об экранах навигации
final class NavigationPathItem: Identifiable, CustomDebugStringConvertible, Hashable {
    /// Флаг привязки, что данный экран открыт
    var isPresented: Binding<Bool>
    /// Идентификатор
    let id: String
    /// Название экрана
    let title: String?

    var debugDescription: String { "navitem: \(id) isPresented: \(isPresented.wrappedValue)" }

    init(isPresented: Binding<Bool>, id: String, title: String) {
        self.isPresented = isPresented
        self.id = id
        self.title = title
    }
    
    static func == (lhs: NavigationPathItem, rhs: NavigationPathItem) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
