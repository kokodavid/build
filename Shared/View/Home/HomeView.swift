//
//  HomeView.swift
//  EduwebParents (iOS)
//
//  Created by Arthur on 21/06/2021.
//

import SwiftUI

struct HomeView: View {
    @State var isDrawerOpen: Bool = false
    @State var students:[Student] = Student.data
    @EnvironmentObject var authManager: AuthManager
    @ObservedObject private var data = StudentData()

    var items: [GridItem] = Array(repeating: .init(.fixed(120)), count: 1)

   
    init(){
        UINavigationBar.appearance().backgroundColor = UIColor(Color.primaryGreen)
    }
    
    var body: some View {
        ZStack{
            if !self.isDrawerOpen {
                NavigationView{
                    VStack{
                        
                        ForEach(students, id:\.studentID){
                            student in
                            NavigationLink(destination:
                                           StudentHomeView(student: student)
                                        
                                           .navigationBarTitle("Student Home", displayMode: .inline)
                                        
                                        ){
                            LazyVGrid(columns: items, spacing: 10) {
                                StudentListView(student: student)
                            }}.padding()
                        }
                        
                        
                        HStack {
                            VStack {
                                Text("School News")
                                Text(students[0].schoolName).font(.caption).foregroundColor(.primaryGreen)
                            }
                            Spacer()
                        }.padding()
                        
                        List {
                            
                        }
                        Spacer()
                    }
                        .navigationBarTitle(Text("Hello, Parent"), displayMode: .inline)
                        
                        .navigationBarItems(leading: Button(action:{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                                self.isDrawerOpen.toggle()
                            }
                        })
                        {
                            Image(systemName: "list.dash")
                        })
                    .background(NavigationConfigurator {
                        nc in
                        nc.navigationBar.barTintColor = .blue
                        nc.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
                    })
                }
            }
            
            NavigationDrawer(isOpen: self.isDrawerOpen, students: students)
        }.background(Color.white)
        .onTapGesture {
            if self.isDrawerOpen {
                self.isDrawerOpen.toggle()
            }
        }.onAppear{
            data.load()
        }
        
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 12")
    }
}
