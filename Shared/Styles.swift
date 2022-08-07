//
//  Styles.swift
//  SwiftUIStyles
//
//  Created by Andrii Boiko (Contractor) on 05.08.2022.
//

import Foundation
import SwiftUI

public typealias Style = ViewModifier



extension View {
   
    func styles<T: Style>(_ style: T) -> ModifiedContent<Self, T> {
        return self.modifier(style)
    }
   
    func styles<T: Style, U: Style>(_ style1: T, _ style2: U) -> ModifiedContent<ModifiedContent<Self, T>, U> {
        return self.modifier(style1).modifier(style2)
    }
    
    func styles<T: Style, U: Style, S: Style>(_ style1: T, _ style2: U, style3: S) -> ModifiedContent<ModifiedContent<ModifiedContent<Self, T>, U>, S> {
        return self.modifier(style1).modifier(style2).modifier(style3)
    }
}

