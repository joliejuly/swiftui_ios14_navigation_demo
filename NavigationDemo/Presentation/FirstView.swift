//
//  FirstView.swift
//  NavigationDemo
//
//  Created by Юлия Никитина on 14.09.2022.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        ZStack {
            Color.black
            Image("first")
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack {
                MainNavigationBar()
                Spacer()
                Button {
                    isSecondViewShown = true
                } label: {
                    Text("Tap me!")
                        .font(.system(size: 30, weight: .heavy, design: .rounded))
                        .foregroundColor(.white)
                }
                .navigationLink(title: "SecondView", destination: SecondView(), isActive: $isSecondViewShown)
                Spacer()
            }
            .padding()
        }
        .ignoresSafeArea(.container, edges: .vertical)
        .navigationBarHidden(true)
    }
    
    @State private var isSecondViewShown = false
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
