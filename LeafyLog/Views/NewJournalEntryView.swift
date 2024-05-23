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

