//
//  ContentView.swift
//  8.6
//
//  Created by Apple  on 10/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    
    @FetchRequest(sortDescriptors:[]) var students:FetchedResults<Student>
    
    var body: some View {
        VStack {
            
//            List(students){ student in
//
//                Text(student.name ?? "Unknown")
//
//            }
            
            List {
                ForEach(students){student in
                    
                    Text(student.name ?? "unknownnnn")
                    
                }
                .onDelete(perform:deleteItems)
            }
            
            
            
            Button("Add"){
                let firstNames = ["1","2","3","D4"]
                let lastNames = ["a","b","c","d"]
                
                
                let chooseFirstName = firstNames.randomElement()!
                let chooseLastName = lastNames.randomElement()!
                
                let student = Student(context: moc)
                student.id = UUID()
                student.name = "\(chooseFirstName)  \(chooseLastName)"
                
                try? moc.save()
                
            }
            
            
            
            
            
            

            
        }
        .padding()
    }
    
    
    
    
    
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { students[$0] }.forEach(moc.delete)

            try? moc.save()
           
        }
    }
    
    
    
    
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
