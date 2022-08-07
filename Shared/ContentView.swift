//
//  ContentView.swift
//  Shared
//
//  Created by Andrii Boiko (Contractor) on 05.08.2022.
//

import SwiftUI


struct Rounded: Style {
    func body(content: Content) -> some View {
        content.cornerRadius(20.0)
    }
}

struct Green: Style {
    func body(content: Content) -> some View {
        content.padding(30).background(.green)
    }
}

struct HelloWorld: Style {
    func body(content: Content) -> some View {
        content.foregroundColor(.red)
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!").style {
                Green()
                Rounded()
                HelloWorld()
            }
            Text("Hello, world!")
                .styles(HelloWorld())
            Button("Delete") {
                
            }.styles(Green(), Rounded())
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

@resultBuilder enum StyleBuilder {
    static func buildBlock<S1: Style>(_ s1: S1) -> ModifiedContent<S1, EmptyModifier> {
        return s1.concat(EmptyModifier())
    }
    
    static func buildBlock<S1: Style, S2: Style>(_ s1: S1, _ s2: S2) -> ModifiedContent<S1, S2> {
        return s1.concat(s2)
    }
    static func buildBlock<S1: Style, S2: Style, S3: Style>(_ s1: S1, _ s2: S2, _ s3: S3) -> ModifiedContent<ModifiedContent<S1, S2>, S3> {
        return s1.concat(s2).concat(s3)
    }
}

extension View {
    func style<S1: Style, S2: Style>(
        @StyleBuilder _ styles: () -> ModifiedContent<S1, S2>
    ) -> some View {
        let result = styles()
        return self.modifier(result)
        
    }
}

