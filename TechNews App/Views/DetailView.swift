//
//  DetailView.swift
//  TechNews App
//
//  Created by Chris Min on 02/01/2024.
//

import SwiftUI
import WebKit

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

#Preview {
    DetailView(url: "https://www.google.com")
}

