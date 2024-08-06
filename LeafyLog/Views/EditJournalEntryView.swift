//
//  EditJournalEntryView.swift
//  LeafyLog
//
//  Created by Ankit on 5/23/24.
//

import SwiftUI

// A view that allows editing a journal entry with the ability to update its title and content
struct EditJournalEntryView: View {
    
    // Set viewModel to EditJournalEntryViewVM
    @StateObject var viewModel: EditJournalEntryViewVM
    
    // Binding to control the presentation of this view
    @Binding var isPresented: Bool
    
    // Initialize viewModel, accepting a journal entry and a binding for presentation control
    init(entry: JournalEntry, isPresented: Binding<Bool>) {
        self._viewModel = StateObject(wrappedValue: EditJournalEntryViewVM(entry: entry))
        self._isPresented = isPresented
    }
    
    var body: some View {
        VStack {
            // Header
            Text("Edit Journal Entry").font(.system(size: 32)).bold().padding()
            // Form
            Form {
                // Title
                TextField("Title", text: $viewModel.title).textFieldStyle(DefaultTextFieldStyle())
                // Content
                TextEditor(text: $viewModel.content).frame(height: 200)
                // Save
                Button("Save") {
                    if viewModel.canSave {
                        viewModel.save()
                        isPresented = false // Dismiss the sheet
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
    EditJournalEntryView(entry: JournalEntry(id: "123", title: "Sample Title", content: "Sample Content", createdDate: Date().timeIntervalSince1970, userId: "exampleUserId"), isPresented: Binding(get: {
        return true
    }, set: {
        _ in
    }))
}


