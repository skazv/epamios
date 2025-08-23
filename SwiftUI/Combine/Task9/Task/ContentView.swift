//
//  ContentView.swift
//  Task
//
//  Created by Suren Kazaryan on 23.08.25.
//

import SwiftUI
import Combine

struct Data: Codable, Identifiable {
    let id: Int
    let title: String
}

class ViewModel: ObservableObject {
    @Published var post: [Data] = []
    private var cancellable: AnyCancellable?
    
    func fetch() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Data].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("finished")
                case .failure(let error):
                    print("\(error)")
                }
            }, receiveValue: { [weak self] posts in
                self?.post = posts
            })
    }
}

struct ContentView: View {
    @StateObject private var vm = ViewModel()
    var body: some View {
        VStack {
            List(vm.post) { post in
                Text(post.title)
            }
            .onAppear {
                vm.fetch()
            }
        }
        .onAppear() {
            
        }
    }
}

#Preview {
    ContentView()
}
