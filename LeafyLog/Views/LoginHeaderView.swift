//
//  LoginHeaderView.swift
//  LeafyLog
//
//  Created by Ankit on 5/15/24.
//

import SwiftUI

struct LoginHeaderView: View {
    
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack {
        
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background).rotationEffect(Angle(degrees: angle))
            
            VStack {
                Text(title).font(.system(size: 50)).foregroundColor(Color.white).bold()
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
