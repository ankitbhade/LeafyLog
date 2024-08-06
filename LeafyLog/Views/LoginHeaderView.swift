//
//  LoginHeaderView.swift
//  LeafyLog
//
//  Created by Ankit on 5/15/24.
//

import SwiftUI

// A header view used for login screens
// This view displays a background color with a rotation effect and text for the title and subtitle
struct LoginHeaderView: View {
    
    // Title displayed in the header
    let title: String
    
    // The subtitle displayed below the title
    let subtitle: String
    
    // The angle for rotating the background rectangle
    let angle: Double
    
    // The background color of the header
    let background: Color
    
    var body: some View {
        ZStack {
            // Background rectangle with rotation effect
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background).rotationEffect(Angle(degrees: angle))
            
            VStack {
                // Title
                Text(title).font(.system(size: 50)).foregroundColor(Color.white).bold()
                // Subtitle
                Text(subtitle).font(.system(size: 20)).foregroundColor(Color.white)
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350).offset(y: -150)
    }
}

#Preview {
    LoginHeaderView(title: "Leafy Log", subtitle: "Stay Rooted With Your Personal Forest", angle: 15, background: Color.green)
}
