//
//  StudentHomeView.swift
//  EduwebParents (iOS)
//
//  Created by user175092 on 7/12/21.
//

import SwiftUI

struct StudentHomeView: View {
    @State var student: Student

    let menuItems = ["Homework & posts","Student details","Fees", "Grading","Analytics","Attendance","Gallery","Resources"]
    
    let menuIcons = ["book.fill","person.fill","dollarsign.square.fill","graduationcap.fill","chart.bar.fill","checkmark","photo.fill","video.bubble.left"]
    
    var body: some View {
        
        VStack {
            
            VStack{
                Image(systemName: "person").font(.system(size: 60))
                    .foregroundColor(.black)
                Text("\(student.studentName)")
                    .foregroundColor(.black)
            }
            
            List{ 
                
                ForEach(Array(zip(menuIcons, menuItems)), id: \.self.0){
                    (menuIcon, menuItem) in
                    NavigationLink(
                        destination: Text("\(menuItem)")
                    ) {
                        HStack{
                            Image(systemName: menuIcon)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.black)
                            
                            Text(menuItem).foregroundColor(.black)
                            Spacer()
                        }
                    }
                }
            }
            
        }
        
        
    }
}

struct StudentHomeView_Previews: PreviewProvider {
    static var previews: some View {
        let student = Student.data
        StudentHomeView(student: student[0])
            .previewDevice("iPhone 12")
    }
}
