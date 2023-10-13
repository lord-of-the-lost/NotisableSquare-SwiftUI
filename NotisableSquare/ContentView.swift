//
//  ContentView.swift
//  NotisableSquare
//
//  Created by Николай Игнатов on 11.10.2023.
//

import SwiftUI

struct ContentView: View {
    @GestureState private var dragOffset = CGSize.zero
    @State private var position = CGPoint(x: 0, y: 0)
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.white
                Color.pink
                Color.yellow
                Color.black
            }
            .ignoresSafeArea()
    
            Rectangle()
                .foregroundColor(.white)
                .blendMode(.difference)
                .overlay(.blendMode(.hue))
                .overlay(Color.white.blendMode(.overlay))
                .overlay(Color.black.blendMode(.overlay))
                .frame(width: 100, height: 100)
                .cornerRadius(10)
                .offset(x: position.x + dragOffset.width, y: position.y + dragOffset.height)
                .gesture(
                    DragGesture()
                        .updating($dragOffset) { value, dragState, _ in
                            dragState = value.translation
                        }
                        .onEnded { value in
                            self.position.x += value.translation.width
                            self.position.y += value.translation.height
                        })
        }
    }
}

#Preview {
    ContentView()
}
