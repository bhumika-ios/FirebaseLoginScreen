//
//  ContentView.swift
//  FirebaseLoginScreen
//
//  Created by Bhumika Patel on 01/07/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isLogged: Bool = false
    var body: some View {
        NavigationView{
            if self.isLogged{
                HomeView()
            }else{
                LoginScreen()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
