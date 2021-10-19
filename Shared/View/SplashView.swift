//
//  ContentView.swift
//  Shared
//
//  Created by Arthur on 21/06/2021.
//

import SwiftUI

struct ContentView: View {
    
    
  @State private var isActive = false
    let login = LoginView()
       
       let home = HomeView()
    
    var body: some View {
        
        if self.isActive{
            LoginView()
            ZStack {
                Color(red: 57/255, green: 124/255, blue: 73/255)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
            }
            .onAppear(perform: {
                self.goToLogin(time: 2.5)
            })
        }
    }
    
    func goToLogin(time: Double){
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(time)){
            self.isActive = true
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
    }
}
