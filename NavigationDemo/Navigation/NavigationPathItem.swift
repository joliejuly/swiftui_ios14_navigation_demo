//
//  NavigationPathItem.swift
//  NavigationDemo
//
//  Created by Юлия Никитина on 14.09.2022.
//

import SwiftUI

/// Информация об экранах навигации
final class NavigationPathItem: Identifiable, CustomDebugStringConvertible {
    /// Флаг привязки, что данный экран открыт
    var isActive: Binding<Bool>
    /// Идентификатор
    let id: String
    /// Название экрана
    let title: String?

    var debugDescription: String { "navitem: \(id) isActive: \(isActive.wrappedValue)" }

    init(isActive: Binding<Bool>, id: String, title: String) {
        self.isActive = isActive
        self.id = id
        self.title = title
    }
}
