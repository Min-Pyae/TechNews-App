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
            
            // CHECKING IF POSTS DATA IS EMPTY
            if networkmanager.posts.isEmpty {
                
                // PROGRESS VIEW
                ProgressView()
                    .onAppear{
                        self.networkmanager.fetchData()
                    }
                    .navigationTitle("Tech News")
                
            } else {
                
                // LISTS OF POST DATA
                List(networkmanager.posts) { post in
                    NavigationLink(destination: DetailView(url: post.url)) {
                        HStack {
                            Text(String(post.points))
                            Text(post.title)
                        }
                    }
                    
                }
                .navigationTitle("Tech News")
            }
            
            
        }
        
    }
}

#Preview {
    ContentView()
}
