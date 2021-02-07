//
//  LoginView.swift
//  smackdown
//
//  Created by Tiernan Garsys on 2/3/21.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = "smackdowntest"
    @State private var password: String = "pikapika"
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("username", text: $username)
            TextField("password", text: $password)
            Button("Login") {
                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
