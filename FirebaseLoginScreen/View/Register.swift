//
//  Register.swift
//  FirebaseLoginScreen
//
//  Created by Bhumika Patel on 21/07/22.
//

import SwiftUI
import Firebase

struct Register : View{
    @State var email = ""
    @State var pass = ""
    @State var repass = ""
    @State var visible = false
    @State var revisible = false
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
                            Text("Register").bold().font(.largeTitle)
                                .foregroundColor(Color.white)
                            Text("Here").font(.title).foregroundColor(Color.white)
                        }
                        .padding(.horizontal,40)
                        Spacer()
                        VStack{
                            Image("Reg")
                                .resizable()
                                .frame(width: 180, height: 180)
                                .padding(.horizontal,-40)
                        }
                        
                        
                    }
                   // .padding(.leading,100)
                   Spacer()
                }
                .frame(height: 180)
                .padding(30)
                .background(Color.purple)
                .clipShape(CustomShape(corner: .bottomRight, radii: 50))
                .edgesIgnoringSafeArea(.top)
                    ZStack {
                        ZStack(alignment: .topTrailing){
                                    GeometryReader{_ in
                                        VStack(alignment:.leading){
//                                            Text("Create Account")
//                                                .font(.system(size: 22).bold())
//                                            .padding(.top,175)
//                                            .multilineTextAlignment(.center)
//                                            Text("Create your Account")
//                                                .font(.callout)
                                            
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
                                            Text("Re-Password")
                                                .padding(.top)
                                            HStack{
                                                
                                                VStack{
                                                    
                                                    if self.revisible{
                                                        TextField("Password", text: self.$repass)
                                                            .autocapitalization(.none)
                                                    } else{
                                                        SecureField("Password", text: self.$repass)
                                                            .autocapitalization(.none)
                                                    
                                                    }
                                                }
                                                Button(action: {
                                                    self.revisible.toggle()
                                                }) {
                                                    Image(systemName: self.revisible ? "eye.slash.fill" : "eye.fill")
                                                        .foregroundColor(self.color)
                                                }
                                            }
                                            .padding()
                                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass != "" ? Color.blue : self.color,lineWidth: 2))
                                            .padding(.top, 1)
                                        // Text(passObj.error).foregroundColor(.red).font(.system(size: 13))
                                            //.padding()
                                            VStack{
                                                Button {
                                                
                                                    // check email and password empty
                                                //  self.verify()
                                                    self.register()
                                                } label: {
                                                    
                                                Text("Create")
                                                .foregroundColor(.white)
                                                .fontWeight(.semibold)
                                                .frame(width: 360, height: 50)
                                                .background(Color.purple)
                                                .cornerRadius(10)
                //                                    let accessToken: String? = KeychainWrapper.standard.string(forKey: "accessToken")
                //                                    if accessToken != nil{
                //                                        NavigationLink(destination: Text("You are logged in @\($emailObj.email.wrappedValue)"), isActive: $loginApi.isLoginSuccessful) {
                //                                            EmptyView()
                //                                        }
                //                                    }
                                                .padding()
                                                }
                                            }
                                            .padding(.horizontal,-15)
                                            Divider()
                                                .padding(.vertical,10)
                                            HStack{
                                                
                                                Button {
                                                    self.show.toggle()
                                                    // check email and password empty
                                                // self.verify()
                                                
                                                } label: {
                                                    
                                                Text("Back to ")
                                                        .foregroundColor(.black)
                                                Text("Login")
                                                .foregroundColor(Color.blue)
                                                 .fontWeight(.semibold)
                                                //.frame(width: 150, height: 40)
                                                //.background(Color.blue)
                                                .cornerRadius(10)

                                                
                                                }
                                               // .padding()
                                                .padding(.vertical,3)
                                                .padding(.horizontal,120)
                                            }
                                            
                                         .padding(.horizontal,-10)
                                            
                                        }.padding(.horizontal,15)
                                       
                                    }
//                                    Button{
//                                        self.show.toggle()
//                                        } label: {
//                                           Image(systemName: "chevron.left")
//                                                .font(.title)
//                                                .foregroundColor(Color.blue)
//                                                //.fontWeight(.semibold)
//
//
//                                        }
                                       // .padding()
                                
                        }
                        if self.alert{
                            ErrorView(alert: self.$alert, error: self.$error)
                        }
                    }
                    .offset(y:-120)
               
//                if self.alert{
//                    ErrorView(alert: self.$alert, error: self.$error)
//                }
            
               .navigationBarBackButtonHidden(true)
            }
        }
    }
    func register(){
        if self.email != ""{
            //if self.email != email{
            if self.pass == self.repass{
                Auth.auth().createUser(withEmail: self.email, password: self.pass){ (res, err) in
                    if err != nil{
                        self.error = err!.localizedDescription
                        self.error = "Create Successfully"
                        self.alert.toggle()
                        
                        return
                    }
                    print("success")
                    
//                    UserDefaults.standard.set(true, forKey: "status")
//                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                }
            }else{
                self.error = "Password mismatch"
                self.alert.toggle()
            }
    //   }//else{
//                self.error = "Please used another email id bcoz used email id"
//                self.alert.toggle()
//            }
        }else{
            self.error = "Please fill all the contains properly"
            self.alert.toggle()
        }
    }
}

//struct Register_Previews: PreviewProvider {
//    static var previews: some View {
//        Register(show: self.$show)
//    }
//}
