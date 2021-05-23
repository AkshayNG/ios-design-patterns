//
//  ContentView.swift
//  ios-design-patterns
//
//  Created by Akshay Gajarlawar on 23/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Text("Hello, world!")
                .padding()
        }.onAppear {
            self.useSingleton()
        }
        
    }
    
    func useSingleton(){
        Singleton.shared.set("Dark", forKey: "Theme")
        let theme = Singleton.shared.object(forKey: "Theme")
        print(theme ?? "No Theme")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
