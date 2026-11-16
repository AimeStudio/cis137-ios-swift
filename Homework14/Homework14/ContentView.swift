//
//  ContentView.swift
//  Homework14
//
//  Created by Aimee Jin on 11/16/26.
//

import SwiftUI


struct ZoomView: View {
    @State private var scale = 1.0
    var body: some View {
        VStack {
            Image("mexico-cozumel")
                .scaleEffect(scale)
                .gesture(
                    TapGesture().onEnded { _ in
                        scale = max(0.2, scale - 0.2)
                    }
                )
                .gesture(
                    LongPressGesture(minimumDuration: 1)
                        .onEnded { _ in
                            scale += 0.6
                    }
                )
            Text("Tab image to zoom out")
                .background(Color.white)
            Text("Long press image to zoom in")
                .background(Color.white)
        }
        .padding()
    }
}

struct ContextView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 12) {
            Text("Why this image?")
                .font(.title)
                .bold()
            Text("I chose this underwater photograph of two large gray angelfish because I going on a scuba diving trip in December in Cozumel, Mexico. I am very excited about what I will see in the ocean.")
            
            Text("Gesture recognizers")
                .font(.title)
                .bold()
            Text("**TapGesture** recognizes a quick, single tap on the image, while **LongPressGesture** recognizes a tap and holds it for at least one second. These two distinct gestures are combined to allow the user to zoom in and out of the image by tapping and long pressing.")
            Spacer()
        }
        .padding(16)
    }
}

struct ContentView: View {
    var body: some View {
        TabView {
            ZoomView()
                .tabItem {
                    Label("Zoom", systemImage: "square.arrowtriangle.4.outward")
                }
            
            ContextView()
                .tabItem {
                    Label("Context", systemImage: "text.justify")
                }
        }
    }
}

#Preview {
    ContentView()
}
