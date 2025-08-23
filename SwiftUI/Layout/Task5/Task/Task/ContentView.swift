//
//  ContentView.swift
//  Task
//
//  Created by Suren Kazaryan on 23.08.25.
//

import SwiftUI
import Combine

struct CardView<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .padding(.bottom, 4)
            content
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            
            CardView(title: "фыва") {
                VStack(alignment: .leading) {
                    Text("фывафыв")
                }
                .font(.subheadline)
            }
            
            CardView(title: "asdfasdf") {
                HStack {
                    Text("asdf")
                    ProgressView() {
                        
                    }
                }
                .font(.subheadline)
            }
            
            CardView(title: "asasdfasdfasdfasdfasdfasdfasdfadf") {
                Button(action: {
                    print("sdfg")
                }) {
                    Text("sdfgsdfg")
                }
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
