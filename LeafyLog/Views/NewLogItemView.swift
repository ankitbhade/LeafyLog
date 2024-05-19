//
//  NewLogItemView.swift
//  LeafyLog
//
//  Created by Ankit on 5/15/24.
//

import SwiftUI

struct NewLogItemView: View {
    
    @StateObject var viewModel = NewLogItemViewVM()
    @Binding var newLogPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Log").font(.system(size: 32)).bold().padding()
            
            Form {
                // Name
                TextField("Title", text: $viewModel.title).textFieldStyle(DefaultTextFieldStyle())
                // Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate).datePickerStyle(GraphicalDatePickerStyle())
                // Button
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
