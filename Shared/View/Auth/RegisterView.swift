//
//  RegisterView.swift
//  EduwebParents (iOS)
//
//  Created by Arthur on 21/06/2021.
//

import SwiftUI

struct RegisterView: View {
    
    @State var phoneNumber: String
    @StateObject private var regVM = RegisterViewModel()
    @EnvironmentObject var authentication: Authentication
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                Spacer()
                HStack {
                    Text("Parent Registration")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                
                Spacer().frame(maxHeight: 50)
                
                VStack {
                    if authentication.isStatus {
                        self.codeScreen
                            .background(Color(.white))
                            .clipShape(RoundedRectangle(cornerRadius: 8 , style: .continuous))
                        Spacer().fixedSize()
                            .padding()
                    }else  if authentication.isCode{
                        self.passScreen
                    }else{
                        self.phoneScreen
                            .background(Color(.white))
                            .clipShape(RoundedRectangle(cornerRadius: 8 , style: .continuous))
                        Spacer().fixedSize()
                            .padding()
                    }
                    if regVM.showProgressView {
                        ProgressView()
                    }else{
                        Button(action: {
                            if authentication.isStatus{
                                regVM.checkCode {
                                    success in
                                    authentication.updateCode(code: success)
                                }
                            }
                            regVM.checkRegStatus {
                                success in
                                print("reg Resullt>\(success)")
                                authentication.updateStatus(status: success)
                            }
                        }){
                            Text((authentication.isCode) ? "REGISTER":"CONTINUE")
                                .padding(10).frame(maxWidth: UIScreen.main.bounds.width - 100,idealHeight: 45).background(Color.white).foregroundColor(Color(red: 57/255, green: 124/255, blue: 73/255))
                        }.padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
                        
                    }
                }
                Spacer()
            }.padding()
            .background(Color(red: 57/255, green: 124/255, blue: 73/255)
            ).edgesIgnoringSafeArea(.all)
            .frame(maxHeight: .infinity)
        }
        
        
    }
 
    var phoneScreen: some View {
        VStack(spacing: 10) {
            Text("Enter your phone number to continue")
                .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                .font(.subheadline)
                .foregroundColor(Color.black)
            
            HStack{
                Image(systemName: "phone.fill")
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                
                
                TextField("Phone number", text: $regVM.phoneNumber)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 10, trailing: 10))
                
            }
            
        }
        
        
    }
    
    var codeScreen: some View{
        VStack(spacing: 10) {
            Text("Enter code received to continue")
                .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                .font(.subheadline)
                .foregroundColor(Color.black)
            
            
            HStack {
                Image(systemName: "phone.fill")
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                
                
                TextField("Code received", text: $regVM.code)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 10, trailing: 10))

            }

            }
        
    }
    
    var passScreen: some View {
        VStack {
            
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(phoneNumber: "").environmentObject(Authentication())
            .previewDevice("iPhone X")
    }
}
