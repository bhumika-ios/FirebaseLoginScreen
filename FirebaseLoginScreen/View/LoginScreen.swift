//
//  LoginScreen.swift
//  FirebaseLoginScreen
//
//  Created by Bhumika Patel on 01/07/22.
//

import SwiftUI

struct LoginScreen: View {
    @State var isLoginMode = false
    var body: some View {
        ScrollView{
            VStack(spacing: 16){
                Picker(selection: $isLoginMode,  label: Text("Picker here")){
                    Text("Login")
                        .tag(true)
                    Text("Create Account")
                        .tag(false)
                }.pickerStyle(SegmentedPickerStyle())
            }
        }
       
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
