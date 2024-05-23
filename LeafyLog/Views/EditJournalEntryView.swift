//
//  EditJournalEntryView.swift
//  LeafyLog
//
//  Created by Ankit on 5/23/24.
//

import SwiftUI

struct EditJournalEntryView: View {
    
    @StateObject var viewModel: EditJournalEntryViewVM
    @Binding var isPresented: Bool
    
    init(entry: JournalEntry, isPresented: Binding<Bool>) {
        self._viewModel = StateObject(wrappedValue: EditJournalEntryViewVM(entry: entry))
        self._isPresented = isPresented
    }
    
    var body: some View {
        VStack {
            Text("Edit Journal Entry").font(.system(size: 32)).bold().padding()
            
            Form {
                TextField("Title", text: $viewModel.title).textFieldStyle(DefaultTextFieldStyle())
                TextEditor(text: $viewModel.content).frame(height: 200)
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


