//
//  FirstView.swift
//  NavigationDemo
//
//  Created by Юлия Никитина on 14.09.2022.
//

import SwiftUI

struct FirstView: View {
    
    var body: some View {
        VStack {
            MainNavigationBar()
            Spacer()
            Button {
                isSecondViewShown = true
            } label: {
                Group {
                    Image(systemName: "apple")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Tap me!")
                }
            }
            .navigationLink(title: "SecondView", destination: SecondView(), isActive: $isSecondViewShown)
            Spacer()
        }
        .padding()
        .navigationBarHidden(true)
    }
    
    @State private var isSecondViewShown = false
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
