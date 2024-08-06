//
//  NewLogItemView.swift
//  LeafyLog
//
//  Created by Ankit on 5/15/24.
//

import SwiftUI

// View for creating a new log item
// This view allows users to enter details for a new log item and save it
struct NewLogItemView: View {
    
    // Set viewModel to NewLogItemViewVM
    @StateObject var viewModel = NewLogItemViewVM()
    
    // Binding to control the presentation state of this view
    @Binding var newLogPresented: Bool
    
    var body: some View {
        VStack {
            // Title
            Text("New Log").font(.system(size: 32)).bold().padding()
            
            Form {
                // Name
                TextField("Title", text: $viewModel.title).textFieldStyle(DefaultTextFieldStyle())
                // Due Date selector
                DatePicker("Due Date", selection: $viewModel.dueDate).datePickerStyle(GraphicalDatePickerStyle())
                // Save Button
                LLButton(title: "Save", background: Color.green) {
                    if viewModel.canSave {
                        viewModel.save()
                        newLogPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
            }
            .alert(isPresented: $viewModel.showAlert) {
               Alert(title: Text("Error"), message: Text("Please Fill In All Fields and Select A Due Date On Or After Today."))
           }
        }
    }
}

#Preview {
    NewLogItemView(newLogPresented: Binding(get: {
        return true
    }, set: {
        _ in
    }))
}
