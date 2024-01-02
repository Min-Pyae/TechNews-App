//
//  ContentView.swift
//  TechNews App
//
//  Created by Chris Min on 02/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkmanager = NetworkManager()
    
    var body: some View {
        NavigationStack {
            List(networkmanager.posts) { post in
                NavigationLink(destination: DetailView()) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }

            }
            .navigationTitle("TechNews")
        }
        .onAppear{
            self.networkmanager.fetchData()
        }
    }
}

#Preview {
    ContentView()
}
