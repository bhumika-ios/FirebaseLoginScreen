//
//  Login.swift
//  FirebaseLoginScreen
//
//  Created by Bhumika Patel on 21/07/22.
//

import SwiftUI
import Firebase

struct Login : View{
    @State var email = ""
    @State var pass = ""
    
    @State var visible = false
    
    @State var color = Color.black.opacity(0.7)
    @State var alert = false
    @State var error = ""
   @Binding var show : Bool
    var body: some View{
        ZStack{
            Color.white
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    HStack{
                        VStack{
                            Text("Hi!").bold().font(.largeTitle)
                                .foregroundColor(Color.white)
                            Text("Welcom back!").font(.title).foregroundColor(Color.white)
                        }
                        Spacer()
                        Image("Bitmap3")
                            .resizable()
                            .frame(width: 100, height: 80)
                            .padding()
                    }
                    Spacer()
                }
                .frame(height: 180)
                .padding(30)
                .background(Color.purple)
                .clipShape(CustomShape(corner: .bottomRight, radii: 50))
                .edgesIgnoringSafeArea(.top)
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
                                            self.reset()
                                            } label: {
                                                Text("ForgotPassword?")
                                                    .foregroundColor(Color.blue)
                                                    .fontWeight(.semibold)
                                                                        
                                                                        
                                            }
                                            .padding(.leading, 20)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                    
                                            
                                
                                            
                                
                                        Button {
                                            
                                            // check email and password empty
                                        self.verify()
                                        
                                        } label: {
                                            
                                        Text("Login")
                                        .foregroundColor(.white)
                                        .fontWeight(.semibold)
                                        .frame(width: 150, height: 40)
                                        .background(Color.purple)
                                        .cornerRadius(10)
        //                                    let accessToken: String? = KeychainWrapper.standard.string(forKey: "accessToken")
        //                                    if accessToken != nil{
        //                                        NavigationLink(destination: Text("You are logged in @\($emailObj.email.wrappedValue)"), isActive: $loginApi.isLoginSuccessful) {
        //                                            EmptyView()
        //                                        }
        //                                    }
                                        
                                        }
                                        
                                    }.padding(.vertical,50)
                                    Divider()
                                        
                                    HStack{
                                        
                                        Button {
                                            self.show.toggle()
                                            // check email and password empty
                                        // self.verify()
                                        
                                        } label: {
                                            
                                        Text("Don't have an Account? ")
                                                .foregroundColor(.black)
                                        Text("Register")
                                        .foregroundColor(Color.blue)
                                         .fontWeight(.semibold)
                                        //.frame(width: 150, height: 40)
                                        //.background(Color.blue)
                                        .cornerRadius(10)

                                        
                                        }
                                        .padding()
                                        .padding(.horizontal)
                                    }
                                // .padding(.vertical,100)
                                }.padding(.horizontal, 15)
                            }
        //                    Button(action: {
        //                        self.show.toggle()
        //                    }) {
        //                        Text("Register")
        //                            .fontWeight(.bold)
        //                            .foregroundColor(Color.blue)
        //                    }
                         //   .padding()
                        }
                    
                        if self.alert{
                            ErrorView(alert: self.$alert, error: self.$error)
                        }
                    }
                   .offset(y: -220)
                
            }
          
        }
    }
    func verify(){
        if self.email != "" && self.pass != ""{
            Auth.auth().signIn(withEmail: self.email, password: self.pass){ (res, err) in
                if err != nil{
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                print("success")
                UserDefaults.standard.set(true, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            }
            
        }else{
            self.error = "Please enter all the content properly"
            self.alert.toggle()
        }
    }
    func reset(){
        if self.email != "" {
            
            Auth.auth().sendPasswordReset(withEmail: self.email) { (err) in
                 
                if err != nil{
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                    }
                self.error = "RESET"
                self.alert.toggle()
                }
                
            }
        else{
            self.error = "Email Id is empty"
            self.alert.toggle()
        }
    }

}

//struct Login_Previews: PreviewProvider {
//    static var previews: some View {
//        Login()
//    }
//}
