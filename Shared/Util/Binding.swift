//
//  Binding.swift
//  smackdown
//
//  Created by Tiernan Garsys on 2/3/21.
//

import Foundation
import SwiftUI

prefix func ! (value: Binding<Bool>) -> Binding<Bool> {
    Binding<Bool>(
        get: { !value.wrappedValue },
        set: { value.wrappedValue = !$0 }
    )
}
