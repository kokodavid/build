//
//  AbsenteeismView.swift
//  EduwebParents (iOS)
//
//  Created by user175092 on 7/16/21.
//

import SwiftUI


struct AbsenteeismView: View {
    @State var studentName: String
    @State var message: String
    @State var selectedReason: String = "Travel"
    @State private var fromDate = Date()
    @State private var toDate = Date()
    
    let reasons = ["Travel","Sickness","Bereavement","Other"]
    var body: some View {
        VStack(alignment: .leading){
            self.titleText
            self.absentForm
//            self.absentDays
        }
    }
    
    var titleText: some View {
        VStack{
            HStack{
            Text("Report Absenteeism").font(.headline)
                Spacer()
            }
            Text("Select the child/children adn reason for absenteeism and enter the specific date or date range the student(s) will be absent").font(.body).foregroundColor(.gray)
        }.padding()
    }
    
    var absentForm: some View {
        VStack {
            Form{
                Section(){
                    self.textField
                    self.reasonPicker
                    self.fromDatePicker
                    self.toDatePicker
                    self.messageEditor
                    self.reportButton
                    self.absentDays
                }
            }
        }
    }
    
    var absentDays: some View {
        VStack {
            Section(){
                HStack{
                Text("Absent Days").font(.headline)
                    Spacer()
                }
                Text("Below are the days the student was absent from school")
                    .font(.body).foregroundColor(.gray)
                
                List{
                    //to do add list items
                }
            }
                            
        }
    }
    
    var textField: some View{
        VStack{
            HStack{
                Text("Student(s)")
                Image(systemName: "person.fill")
                Spacer()
            }
            
            TextField("JOHN DOE", text: $studentName)
                     
        }
    }
    var reasonPicker: some View {
        VStack{
        HStack{
            Text("Reason")
            Image(systemName: "questionmark")
            Spacer()
        }
        Picker("", selection: $selectedReason) {
                            ForEach(reasons, id: \.self) {
                                Text($0)
                            }
        }.frame(height: 40)
        .pickerStyle(DefaultPickerStyle())
    }
    }
    var fromDatePicker: some View{
        VStack{
        HStack{
            Text("Period")
            Image(systemName: "calendar")
            Spacer()
        }
        DatePicker(
            "From Date",
            selection: $fromDate,
            displayedComponents: [.date]
        ).datePickerStyle(DefaultDatePickerStyle())
        }
    }
    var toDatePicker: some View {
        DatePicker(
            "To Date",
            selection: $toDate,
            displayedComponents: [.date])
    }
    
    var messageEditor: some View{
        VStack{
            HStack{
            Text("Message")
            Spacer()
        }
        TextEditor(text: $message)
            .lineLimit(4)
            .lineSpacing(5.0).frame(height: 75)
        }
    }
    
    var reportButton: some View{
        Button(action: {
        
        }){
            
            Text("Report Absenteeism")
                .padding(10).frame(maxWidth: .infinity,idealHeight: 45).background(Color(red: 57/255, green: 124/255, blue: 73/255)).foregroundColor(.white)
            
        }.padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
    }

}

struct AbsenteeismView_Previews: PreviewProvider {
    static var previews: some View {
        AbsenteeismView(studentName: "JOHN DOE", message: "message here ...")
            .previewDevice("iPhone 12")
    }
}
