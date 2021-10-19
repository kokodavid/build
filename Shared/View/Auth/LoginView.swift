//
//  LoginView.swift
//  EduwebParents (iOS)
//
//  Created by Arthur on 21/06/2021.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var loginVM = LoginViewModel()
    @EnvironmentObject var authentication: Authentication
    
    @State private var isChecked = false
    
    
    var body: some View {
        
        if authentication.isValidated {
            HomeView()
        }else{
                NavigationView {
                    ZStack {
                        VStack {
                            Spacer()
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center)
                            Spacer().frame(maxHeight: 100)
                            
                            VStack(spacing: 10) {
                                
                                HStack{
                                    Image(systemName: "person.fill")
                                        .padding(EdgeInsets(top: 20, leading: 10, bottom: 0, trailing: 0))
                                    
                                    
                                    TextField("username", text: $loginVM.credentials.user_name)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .padding(EdgeInsets(top: 20, leading: 5, bottom: 0, trailing: 10))
                                    
                                }
                                HStack{
                                    Image(systemName: "lock.fill")
                                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 0))
                                    
                                    
                                    SecureField("password", text: $loginVM.credentials.user_pwd)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 10))
                                    
                                }
                                if loginVM.showProgressView {
                                    ProgressView()
                                }
                                HStack{
                                    Button(action:
                                            toggle
                                    ){
                                        Image(systemName: isChecked ? "checkmark.square" :"square" )
                                            .foregroundColor(.black)
                                        Text("Remember me")
                                            .foregroundColor(.black)
                                            .font(.subheadline)
                                    }
                                    Spacer()
                                    
                                    NavigationLink(
                                        destination: ForgotPassView()) {
                                        Text("Forgot password?")
                                            .font(.subheadline)
                                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                    }
                                    
                                }.padding()
                              
                                Button(action: {

                                    loginVM.login {
                                        success in
                                        authentication.updateValidation(success: success)
                                    }
                                                                    
                                }){
                                    
                                    Text("LOGIN")
                                        .padding(10).frame(maxWidth: .infinity,idealHeight: 45).background(Color(red: 57/255, green: 124/255, blue: 73/255)).foregroundColor(.white)
                                    
                                }.disabled(loginVM.loginDisabled).padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
                                //                        }
                                NavigationLink(destination: RegisterView(phoneNumber: "")){
                                    Label("Or register new Account", systemImage: "arrow.right")
                                        .labelStyle(VerticalLabelStyle())
                                        .font(.subheadline)
                                        .foregroundColor(.blue)
                                    
                                }.padding(.bottom, 10)
                            }
                            .background(Color(.white))
                            .clipShape(RoundedRectangle(cornerRadius: 8 , style: .continuous))
                            Spacer().frame(maxHeight: 20).fixedSize()
                                .padding()
                            
                        }.padding()
                        
                    } .background(Color(red: 57/255, green: 124/255, blue: 73/255).edgesIgnoringSafeArea(.all))
                    .navigationBarTitle("")
                    .navigationBarItems(leading: EmptyView())
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                    .autocapitalization(.none)
                    .disabled(loginVM.showProgressView)
                    .alert(item: $loginVM.error){ error in
                        Alert(title: Text("Login Invalid"),
                              message: Text(error.localizedDescription),
                              dismissButton: .default(Text("OK")))
                    }
                }
            
            
        }
    }
    struct VerticalLabelStyle: LabelStyle {
        func makeBody(configuration: Configuration) -> some View {
            HStack {
                configuration.title
                configuration.icon
            }
        }
    }
    func toggle() {
        isChecked = !isChecked
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(Authentication())
            .previewDevice("iPhone X")
    }
}
