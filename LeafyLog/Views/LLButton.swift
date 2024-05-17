//
//  LLButton.swift
//  LeafyLog
//
//  Created by Ankit on 5/16/24.
//

import SwiftUI

struct LLButton: View {
    
    let title: String
    let background: Color
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
