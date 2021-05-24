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
            //self.useSingleton()
            self.usePrototype()
        }
        
    }
    
    func useSingleton(){
        Singleton.shared.set("Dark", forKey: "Theme")
        let theme = Singleton.shared.object(forKey: "Theme")
        print(theme ?? "No Theme")
    }
    
    func usePrototype() {
        let p1 = Prototype.init(x: 1, y: 2, shape: Shape.init(type: "Circle", size: 33))
        let p2 = p1.copy() as! Prototype
        p2.x = 3
        p2.y = 4
        p2.shape.type = "Square"
        p2.shape.size = 44
        print("p1: \(p1),\np2: \(p2)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
