//
//  ContentView.swift
//  Task
//
//  Created by Suren Kazaryan on 23.08.25.
//

import SwiftUI
import Combine

class ViewModel: ObservableObject {
    @Published var isLoad: Bool = false
    private var cancellable: AnyCancellable?
    
    init() {
        cancellable = $isLoad
            .sink { value in
                print("\(value)")
            }
    }
    
    func startLoading() {
        isLoad = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.isLoad = false
        }
    }
}

struct ContentView: View {
    @StateObject private var vm = ViewModel()
    var body: some View {
        VStack {
            Text(vm.isLoad ? "load..." : "not load)")
                .font(.title)
            Button("+1") {
                vm.startLoading()
            }
        }
        .padding()
        .onAppear() {
            
        }
    }
}

#Preview {
    ContentView()
}
