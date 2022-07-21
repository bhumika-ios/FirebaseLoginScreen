//
//  ContentView.swift
//  FirebaseLoginScreen
//
//  Created by Bhumika Patel on 01/07/22.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @State private var isLogged: Bool = false
    var body: some View {
        
       Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View{
    @State var show = false
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    var body: some View{
        NavigationView{
            VStack{
                if self.status{
                    HomeScreen()
                }else{
                    ZStack(alignment: .top){
                        NavigationLink(destination: Register(show: self.$show), isActive: self.$show){
                            Text("")
                        }
                        .hidden()
                        Login(show: self.$show)
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
           .navigationBarBackButtonHidden(true)
           .onAppear{
               NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main){ (_) in
                   self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
               }
           }
        }
       
    }
}
//struct HomeScreen : View{
//    var body: some View{
//        VStack{
//            Text("Logged successfully")
//                .font(.title)
//                .fontWeight(.bold)
//                .foregroundColor(Color.black.opacity(0.7))
//            Button(action: {
//                try! Auth.auth().signOut()
//                UserDefaults.standard.set(false, forKey: "status")
//                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
//            }) {
//                Text("LogOut")
//                    .fontWeight(.bold)
//                    .foregroundColor(Color.blue)
//            }
//        }
//    }
//}

//struct Login : View{
//    @State var email = ""
//    @State var pass = ""
//    
//    @State var visible = false
//    
//    @State var color = Color.black.opacity(0.7)
//    @State var alert = false
//    @State var error = ""
//   @Binding var show : Bool
//    var body: some View{
//        ZStack{
//            Color.white
//                .edgesIgnoringSafeArea(.all)
//            VStack{
//                HStack{
//                    HStack{
//                        VStack{
//                            Text("Hi!").bold().font(.largeTitle)
//                                .foregroundColor(Color.white)
//                            Text("Welcom back!").font(.title).foregroundColor(Color.white)
//                        }
//                        Spacer()
//                        Image("Bitmap3")
//                            .resizable()
//                            .frame(width: 100, height: 80)
//                            .padding()
//                    }
//                    Spacer()
//                }
//                .frame(height: 180)
//                .padding(30)
//                .background(Color.purple)
//                .clipShape(CustomShape(corner: .bottomRight, radii: 50))
//                .edgesIgnoringSafeArea(.top)
//                   ZStack{
//                            ZStack(alignment: .topTrailing){
//                            GeometryReader{_ in
//                                VStack(alignment:.leading){
//                                    Text("Log In")
//                                        .font(.system(size: 22).bold())
//                                    .padding(.top,175)
//                                    .multilineTextAlignment(.center)
//                                    Text("Log in your Account")
//                                        .font(.callout)
//                                    
//                                    Text(self.error).foregroundColor(.red).font(.system(size: 16))
//                                        .padding(.top,1)
//                                    Text("Email")
//                                        .padding(.top)
//                                    TextField("Email", text: $email)
//                                        .keyboardType(.emailAddress)
//                                        .autocapitalization(.none)
//                                        .padding()
//                                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color.blue : self.color,lineWidth: 2))
//                                        .padding(.top, 1)
//                                // Text(emailObj.error).foregroundColor(.red).font(.system(size: 13))
//                                    Text("Password")
//                                        .padding(.top)
//                                    HStack{
//                                        
//                                        VStack{
//                                            
//                                            if self.visible{
//                                                TextField("Password", text: self.$pass)
//                                                    .autocapitalization(.none)
//                                            } else{
//                                                SecureField("Password", text: self.$pass)
//                                                    .autocapitalization(.none)
//                                            
//                                            }
//                                        }
//                                        Button(action: {
//                                            self.visible.toggle()
//                                        }) {
//                                            Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
//                                                .foregroundColor(self.color)
//                                        }
//                                    }
//                                    .padding()
//                                    
//                                    .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass != "" ? Color.blue : self.color,lineWidth: 2))
//                                    .padding(.top, 1)
//                                // Text(passObj.error).foregroundColor(.red).font(.system(size: 13))
//                                    HStack{
//                                        Button{
//                                            self.reset()
//                                            } label: {
//                                                Text("ForgotPassword?")
//                                                    .foregroundColor(Color.blue)
//                                                    .fontWeight(.semibold)
//                                                                        
//                                                                        
//                                            }
//                                            .padding(.leading, 20)
//                                            .frame(maxWidth: .infinity, alignment: .leading)
//                                        
//                                    
//                                            
//                                
//                                            
//                                
//                                        Button {
//                                            
//                                            // check email and password empty
//                                        self.verify()
//                                        
//                                        } label: {
//                                            
//                                        Text("Login")
//                                        .foregroundColor(.white)
//                                        .fontWeight(.semibold)
//                                        .frame(width: 150, height: 40)
//                                        .background(Color.purple)
//                                        .cornerRadius(10)
//        //                                    let accessToken: String? = KeychainWrapper.standard.string(forKey: "accessToken")
//        //                                    if accessToken != nil{
//        //                                        NavigationLink(destination: Text("You are logged in @\($emailObj.email.wrappedValue)"), isActive: $loginApi.isLoginSuccessful) {
//        //                                            EmptyView()
//        //                                        }
//        //                                    }
//                                        
//                                        }
//                                        
//                                    }.padding(.vertical,50)
//                                    Divider()
//                                        
//                                    HStack{
//                                        
//                                        Button {
//                                            self.show.toggle()
//                                            // check email and password empty
//                                        // self.verify()
//                                        
//                                        } label: {
//                                            
//                                        Text("Don't have an Account? ")
//                                                .foregroundColor(.black)
//                                        Text("Register")
//                                        .foregroundColor(Color.blue)
//                                         .fontWeight(.semibold)
//                                        //.frame(width: 150, height: 40)
//                                        //.background(Color.blue)
//                                        .cornerRadius(10)
//
//                                        
//                                        }
//                                        .padding()
//                                        .padding(.horizontal)
//                                    }
//                                // .padding(.vertical,100)
//                                }.padding(.horizontal, 15)
//                            }
//        //                    Button(action: {
//        //                        self.show.toggle()
//        //                    }) {
//        //                        Text("Register")
//        //                            .fontWeight(.bold)
//        //                            .foregroundColor(Color.blue)
//        //                    }
//                         //   .padding()
//                        }
//                    
//                        if self.alert{
//                            ErrorView(alert: self.$alert, error: self.$error)
//                        }
//                    }
//                   .offset(y: -220)
//                
//            }
//          
//        }
//    }
//    func verify(){
//        if self.email != "" && self.pass != ""{
//            Auth.auth().signIn(withEmail: self.email, password: self.pass){ (res, err) in
//                if err != nil{
//                    self.error = err!.localizedDescription
//                    self.alert.toggle()
//                    return
//                }
//                print("success")
//                UserDefaults.standard.set(true, forKey: "status")
//                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
//            }
//            
//        }else{
//            self.error = "Please enter all the content properly"
//            self.alert.toggle()
//        }
//    }
//    func reset(){
//        if self.email != "" {
//            
//            Auth.auth().sendPasswordReset(withEmail: self.email) { (err) in
//                 
//                if err != nil{
//                    self.error = err!.localizedDescription
//                    self.alert.toggle()
//                    return
//                    }
//                self.error = "RESET"
//                self.alert.toggle()
//                }
//                
//            }
//        else{
//            self.error = "Email Id is empty"
//            self.alert.toggle()
//        }
//    }
//
//}
//struct Register : View{
//    @State var email = ""
//    @State var pass = ""
//    @State var repass = ""
//    @State var visible = false
//    @State var revisible = false
//    @State var color = Color.black.opacity(0.7)
//    @State var alert = false
//    @State var error = ""
//    @Binding var show : Bool
//    var body: some View{
//        ZStack{
//            Color.white
//                .edgesIgnoringSafeArea(.all)
//            VStack{
//                HStack{
//                    HStack{
//                        VStack{
//                            Text("Register").bold().font(.largeTitle)
//                                .foregroundColor(Color.white)
//                            Text("Here").font(.title).foregroundColor(Color.white)
//                        }
//                        .padding(.horizontal,40)
//                        Spacer()
//                        VStack{
//                            Image("Reg")
//                                .resizable()
//                                .frame(width: 180, height: 180)
//                                .padding(.horizontal,-40)
//                        }
//                        
//                        
//                    }
//                   // .padding(.leading,100)
//                   Spacer()
//                }
//                .frame(height: 180)
//                .padding(30)
//                .background(Color.purple)
//                .clipShape(CustomShape(corner: .bottomRight, radii: 50))
//                .edgesIgnoringSafeArea(.top)
//                    ZStack {
//                        ZStack(alignment: .topTrailing){
//                                    GeometryReader{_ in
//                                        VStack(alignment:.leading){
////                                            Text("Create Account")
////                                                .font(.system(size: 22).bold())
////                                            .padding(.top,175)
////                                            .multilineTextAlignment(.center)
////                                            Text("Create your Account")
////                                                .font(.callout)
//                                            
//                                            Text(self.error).foregroundColor(.red).font(.system(size: 16))
//                                                .padding(.top,1)
//                                            Text("Email")
//                                                .padding(.top)
//                                            TextField("Email", text: $email)
//                                                .keyboardType(.emailAddress)
//                                                .autocapitalization(.none)
//                                                .padding()
//                                                .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color.blue : self.color,lineWidth: 2))
//                                                .padding(.top, 1)
//                                        // Text(emailObj.error).foregroundColor(.red).font(.system(size: 13))
//                                            Text("Password")
//                                                .padding(.top)
//                                            HStack{
//                                                
//                                                VStack{
//                                                    
//                                                    if self.visible{
//                                                        TextField("Password", text: self.$pass)
//                                                            .autocapitalization(.none)
//                                                    } else{
//                                                        SecureField("Password", text: self.$pass)
//                                                            .autocapitalization(.none)
//                                                    
//                                                    }
//                                                }
//                                                Button(action: {
//                                                    self.visible.toggle()
//                                                }) {
//                                                    Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
//                                                        .foregroundColor(self.color)
//                                                }
//                                            }
//                                            .padding()
//                                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass != "" ? Color.blue : self.color,lineWidth: 2))
//                                            .padding(.top, 1)
//                                            Text("Re-Password")
//                                                .padding(.top)
//                                            HStack{
//                                                
//                                                VStack{
//                                                    
//                                                    if self.revisible{
//                                                        TextField("Password", text: self.$repass)
//                                                            .autocapitalization(.none)
//                                                    } else{
//                                                        SecureField("Password", text: self.$repass)
//                                                            .autocapitalization(.none)
//                                                    
//                                                    }
//                                                }
//                                                Button(action: {
//                                                    self.revisible.toggle()
//                                                }) {
//                                                    Image(systemName: self.revisible ? "eye.slash.fill" : "eye.fill")
//                                                        .foregroundColor(self.color)
//                                                }
//                                            }
//                                            .padding()
//                                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass != "" ? Color.blue : self.color,lineWidth: 2))
//                                            .padding(.top, 1)
//                                        // Text(passObj.error).foregroundColor(.red).font(.system(size: 13))
//                                            //.padding()
//                                            VStack{
//                                                Button {
//                                                
//                                                    // check email and password empty
//                                                //  self.verify()
//                                                    self.register()
//                                                } label: {
//                                                    
//                                                Text("Create")
//                                                .foregroundColor(.white)
//                                                .fontWeight(.semibold)
//                                                .frame(width: 360, height: 50)
//                                                .background(Color.purple)
//                                                .cornerRadius(10)
//                //                                    let accessToken: String? = KeychainWrapper.standard.string(forKey: "accessToken")
//                //                                    if accessToken != nil{
//                //                                        NavigationLink(destination: Text("You are logged in @\($emailObj.email.wrappedValue)"), isActive: $loginApi.isLoginSuccessful) {
//                //                                            EmptyView()
//                //                                        }
//                //                                    }
//                                                .padding()
//                                                }
//                                            }
//                                            .padding(.horizontal,-15)
//                                            Divider()
//                                                .padding(.vertical,10)
//                                            HStack{
//                                                
//                                                Button {
//                                                    self.show.toggle()
//                                                    // check email and password empty
//                                                // self.verify()
//                                                
//                                                } label: {
//                                                    
//                                                Text("Back to ")
//                                                        .foregroundColor(.black)
//                                                Text("Login")
//                                                .foregroundColor(Color.blue)
//                                                 .fontWeight(.semibold)
//                                                //.frame(width: 150, height: 40)
//                                                //.background(Color.blue)
//                                                .cornerRadius(10)
//
//                                                
//                                                }
//                                               // .padding()
//                                                .padding(.vertical,3)
//                                                .padding(.horizontal,120)
//                                            }
//                                            
//                                         .padding(.horizontal,-10)
//                                            
//                                        }.padding(.horizontal,15)
//                                       
//                                    }
////                                    Button{
////                                        self.show.toggle()
////                                        } label: {
////                                           Image(systemName: "chevron.left")
////                                                .font(.title)
////                                                .foregroundColor(Color.blue)
////                                                //.fontWeight(.semibold)
////
////
////                                        }
//                                       // .padding()
//                                
//                        }
//                        if self.alert{
//                            ErrorView(alert: self.$alert, error: self.$error)
//                        }
//                    }
//                    .offset(y:-120)
//               
////                if self.alert{
////                    ErrorView(alert: self.$alert, error: self.$error)
////                }
//            
//               .navigationBarBackButtonHidden(true)
//            }
//        }
//    }
//    func register(){
//        if self.email != ""{
//            //if self.email != email{
//            if self.pass == self.repass{
//                Auth.auth().createUser(withEmail: self.email, password: self.pass){ (res, err) in
//                    if err != nil{
//                        self.error = err!.localizedDescription
//                        self.error = "Create Successfully"
//                        self.alert.toggle()
//                        
//                        return
//                    }
//                    print("success")
//                    
////                    UserDefaults.standard.set(true, forKey: "status")
////                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
//                }
//            }else{
//                self.error = "Password mismatch"
//                self.alert.toggle()
//            }
//    //   }//else{
////                self.error = "Please used another email id bcoz used email id"
////                self.alert.toggle()
////            }
//        }else{
//            self.error = "Please fill all the contains properly"
//            self.alert.toggle()
//        }
//    }
//}

//struct ErrorView : View{
//    @State var color = Color.black.opacity(0.7)
//    @Binding var alert : Bool
//    @Binding var error : String
//    var body: some View{
//        GeometryReader{_ in
//            VStack{
//                HStack{
//                    Text(self.error == "RESET" ? "Message" : "")
//                        .font(.title)
//                        .fontWeight(.bold)
//                        .foregroundColor(self.color)
//
//                    Spacer()
//                }
//                .padding(.horizontal, 25)
//
//                Text(self.error == "RESET" ? "Password reset link has been sent successfully" : self.error)
//                    .foregroundColor(Color.black)
//                    .padding(.top)
//                    .padding(.horizontal,25)
//                Button(action: {
//                    self.alert.toggle()
//                }) {
//
//                    Text(self.error == "RESET" ? "Ok" : "Cancel")
//                        .foregroundColor(.white)
//                        .padding(.vertical)
//                        .frame(width: UIScreen.main.bounds.width - 120)
//                }
//                .background(Color.purple)
//                .cornerRadius(10)
//                .padding(.top,25)
//            }
//            .padding(.vertical,25)
//            .frame(width: UIScreen.main.bounds.width - 70)
//            .background(Color.white)
//            .cornerRadius(15)
//        }.padding(.top,150)
//            .padding(.horizontal,35)
//        .background(Color.black.opacity(0.35).edgesIgnoringSafeArea(.all))
//    }
//}
//struct CustomShape : Shape {
//    var corner : UIRectCorner
//    var radii : CGFloat
//    
//    func path(in rect: CGRect) -> Path {
//        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radii, height: radii))
//        
//        return Path(path.cgPath)
//    }
//}
