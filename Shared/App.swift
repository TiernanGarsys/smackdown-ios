//
//  smackdownApp.swift
//  Shared
//
//  Created by Tiernan Garsys on 2/1/21.
//

import SwiftUI

@main
struct app: App {
    
    let session: SessionManager
    
    init() {
        session = SessionManager()
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(session)
        }
    }
}
