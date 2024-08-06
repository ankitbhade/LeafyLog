//
//  LLButton.swift
//  LeafyLog
//
//  Created by Ankit on 5/16/24.
//

import SwiftUI

// A customizable button with a rounded rectangle background
// This button allows you to specify a title, background color, and action
struct LLButton: View {
    
    // The text displayed on the button
    let title: String
    
    // The background color of the button
    let background: Color
    
    // Action for the button
    let action: ()-> Void
    
    var body: some View {
        Button {
            action() // Action
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10).foregroundColor(background)
                
                Text(title).foregroundColor(Color.white).bold()
            }
        }
        .padding()
    }
}

#Preview {
    LLButton(title: "Action", background: Color.green) {
        // Action
    }
}
