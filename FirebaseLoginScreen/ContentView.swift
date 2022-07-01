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
        
        Login()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View{
    var body: some View{
        VStack{
                Spacer()
        }
    }
}

struct Login : View{
    @State var email = ""
    @State var pass = ""
    @State var repass = ""
    @State var visible = false
    @State var revisible = false
    @State var color = Color.black.opacity(0.7)
    @State var alert = false
    @State var error = ""
    var body: some View{
        NavigationView{
            ZStack{
                ZStack(alignment: .topTrailing){
                    GeometryReader{_ in
                        VStack(alignment:.leading){
                            Text("Log In")
                                .font(.system(size: 22).bold())
                            .padding(.top,175)
                            .multilineTextAlignment(.center)
                            Text("Log in your Account")
                                .font(.callout)
                            
                            Text(self.error).foregroundColor(.red).font(.system(size: 16))
                                .padding(.top,1)
                            Text("Email")
                                .padding(.top)
                            TextField("Email", text: $email)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color.blue : self.color,lineWidth: 2))
                                .padding(.top, 1)
                           // Text(emailObj.error).foregroundColor(.red).font(.system(size: 13))
                            Text("Password")
                                .padding(.top)
                            HStack{
                                
                                VStack{
                                    
                                    if self.visible{
                                        TextField("Password", text: self.$pass)
                                            .autocapitalization(.none)
                                    } else{
                                        SecureField("Password", text: self.$pass)
                                            .autocapitalization(.none)
                                    
                                    }
                                }
                                Button(action: {
                                    self.visible.toggle()
                                }) {
                                    Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                        .foregroundColor(self.color)
                                }
                            }
                            .padding()
                            
                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass != "" ? Color.blue : self.color,lineWidth: 2))
                            .padding(.top, 1)
                           // Text(passObj.error).foregroundColor(.red).font(.system(size: 13))
                            HStack{
                                Button{
                                
                                    } label: {
                                        Text("ForgotPassword?")
                                            .foregroundColor(Color.blue)
                                            .fontWeight(.semibold)
                                                                
                                                                
                                    }
                                    .padding(.leading, 20)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                               
                                    
                        
                                    
                        
                                Button {
                                    
                                    // check email and password empty
                                  //  self.verify()
                                   
                                } label: {
                                    
                                Text("Login")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .frame(width: 150, height: 40)
                                .background(Color.blue)
                                .cornerRadius(10)
//                                    let accessToken: String? = KeychainWrapper.standard.string(forKey: "accessToken")
//                                    if accessToken != nil{
//                                        NavigationLink(destination: Text("You are logged in @\($emailObj.email.wrappedValue)"), isActive: $loginApi.isLoginSuccessful) {
//                                            EmptyView()
//                                        }
//                                    }
                                   
                                }
                            }.padding(.vertical,25)
                        }.padding(.horizontal, 15)
                    }
                    Button(action: {
                        
                    }) {
                        Text("Register")
                            .fontWeight(.bold)
                            .foregroundColor(Color.blue)
                    }
                    .padding()
                }
               
//                if self.alert{
//                    ErrorView(alert: self.$alert, error: self.$error)
//                }
            }
            .navigationBarHidden(true)
        }
    }
}
