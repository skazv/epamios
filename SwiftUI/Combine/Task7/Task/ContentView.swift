//
//  ContentView.swift
//  Task
//
//  Created by Suren Kazaryan on 23.08.25.
//

import SwiftUI
import Combine

class ViewModel: ObservableObject {
    let butonPressed = PassthroughSubject<Void, Never>()
    
    @Published var pressCount = 0
    private var cancellable: AnyCancellable?
    
    init() {
        cancellable = butonPressed
            .sink { [weak self] in
                self?.pressCount += 1
            }
    }
}

struct ContentView: View {
    @StateObject private var vm = ViewModel()
    var body: some View {
        VStack {
            Text("\(vm.pressCount)")
                .font(.title)
            Button("+1") {
                vm.butonPressed.send()
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
