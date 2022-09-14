//
//  MainNavigationBar.swift
//  NavigationDemo
//
//  Created by Юлия Никитина on 14.09.2022.
//

import SwiftUI

/// Бар навигации с хлебными крошками
struct MainNavigationBar: View {
    
    private enum Constants {
        static let arrowImage = Image("backArrow")
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 50)
            navigationTitlesView
        }
    }

    @ObservedObject private var storage = NavigationStorage.shared

    private var navigationTitlesView: some View {
        HStack {
            if let items = storage.pathItems {
                ForEach(Array(items.enumerated()), id: \.1.id) { index, item in
                    makeTitleButton(item: item, index: index, isLast: index == items.endIndex - 1)
                }
            }
            Spacer()
        }
    }
    
    @ViewBuilder
    private func makeTitleButton(item: NavigationPathItem, index: Int, isLast: Bool) -> some View {
        Button {
            guard !isLast else { return }
            storage.popTo(id: item.id)
        } label: {
            if index != 0 {
                Constants.arrowImage
            }
            if let title = item.title {
                Text(title)
                    .font(.system(size: 20, weight: isLast ? .heavy : .medium, design: .rounded))
                    .lineLimit(1)
            }
        }
        .frame(height: 30)
        .foregroundColor(.white)
    }
}



struct MainNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        MainNavigationBar()
    }
}
