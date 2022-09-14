//
//  ContentView.swift
//  NavigationDemo
//
//  Created by Юлия Никитина on 13.09.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainNavigationView {
            Button {
                isFirstViewShown = true
            } label: {
                Group {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Tap me!")
                }
            }
            .navigationLink(title: "FirstView", destination: FirstView(), isActive: $isFirstViewShown)
        }
        .onAppear {
            NavigationStorage.shared.addMainScreenPathItem()
        }
    }
    
    @State private var isFirstViewShown = false
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
