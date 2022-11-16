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
            ZStack {
                Image("home")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .opacity(0.7)
                Button {
                    isFirstViewShown = true
                } label: {
                    Text("Go!")
                        .font(.system(size: 50, weight: .heavy, design:  .rounded))
                        .foregroundColor(.white)
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
