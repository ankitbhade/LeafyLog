//
//  NewJournalEntryView.swift
//  LeafyLog
//
//  Created by Ankit on 5/23/24.
//

import SwiftUI

struct NewJournalEntryView: View {
    
    @StateObject var viewModel = NewJournalEntryViewVM()
    @Binding var newJournalPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Journal Entry").font(.system(size: 32)).bold().padding()
            
            Form {
                // Title
                TextField("Title", text: $viewModel.title).textFieldStyle(DefaultTextFieldStyle())
                // Content
                TextEditor(text: $viewModel.content).frame(height: 200)
                // Date
                DatePicker("Select Date", selection: $viewModel.selectedDate, displayedComponents: .date)
                                    .datePickerStyle(GraphicalDatePickerStyle())
                // Random prompt
                Button(action: {
                    viewModel.selectRandomPrompt()
                }) {
                    Text("Use a Random Prompt")
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                // Button
                Button("Save") {
                    if viewModel.canSave {
                        viewModel.save()
                        newJournalPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
            }
            .alert(isPresented: $viewModel.showAlert) {
               Alert(title: Text("Error"), message: Text("Please Fill In All Fields."))
           }
        }
    }
}

#Preview {
    NewJournalEntryView(newJournalPresented: Binding(get: {
        return true
    }, set: {
        _ in
    }))
}

