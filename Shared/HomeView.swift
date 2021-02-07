//
//  HomeView.swift
//  Shared
//
//  Created by Tiernan Garsys on 2/1/21.
//

import SwiftUI


struct HomeView: View {
    
    @EnvironmentObject var session: SessionManager
    
    var body: some View {
        VStack() {
            Text("SMACKDOWN")
                .background(Color.red)
            Text("MESSAGES")
            ScrollView() {
                ForEach(session.receivedMessages, id: \.self) { message in
                    Text(message)
                        .padding(5)
                        .font(.system(size:10))
                }
            }
        }.background(Color.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
