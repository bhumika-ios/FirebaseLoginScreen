//
//  HomeScreen.swift
//  FirebaseLoginScreen
//
//  Created by Bhumika Patel on 21/07/22.
//

import SwiftUI
import Firebase

struct HomeScreen : View{
    var body: some View{
        VStack{
            Text("Logged successfully")
            //Text()
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.black.opacity(0.7))
            Button(action: {
                try! Auth.auth().signOut()
                UserDefaults.standard.set(false, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            }) {
                Text("LogOut")
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
