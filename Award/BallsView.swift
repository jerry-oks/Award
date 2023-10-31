//
//  BallsView.swift
//  Award
//
//  Created by HOLY NADRUGANTIX on 31.10.2023.
//

import SwiftUI

struct BallsView: View {
    @Binding var achievementIsUnlocked: Bool
        
    @State private var size = UIScreen.main.bounds.height * 2
    @State private var rotation = 0.0
    
    var body: some View {
        let farOffset = size / 2
        let nearOffset = size / 2.8
        
        ZStack {
            BallView(color: .red)
                .offset(x: 0, y: -farOffset)
            BallView(color: .yellow)
                .offset(x: nearOffset, y: -nearOffset)
            BallView(color: .green)
                .offset(x: farOffset, y: 0)
            BallView(color: .purple)
                .offset(x: nearOffset, y: nearOffset)
            BallView(color: .blue)
                .offset(x: 0, y: farOffset)
            BallView(color: .pink)
                .offset(x: -nearOffset, y: nearOffset)
            BallView(color: .mint)
                .offset(x: -farOffset, y: 0)
            BallView(color: .orange)
                .offset(x: -nearOffset, y: -nearOffset)
        }
        .frame(width: size, height: size)
        .rotationEffect(.degrees(rotation))
        .animation(.smooth(duration: 5), value: rotation)
        .animation(.smooth(duration: 5), value: size)
        .onChange(of: achievementIsUnlocked) {
            size -= size
            rotation = 360
        }
    }
}

#Preview {
    BallsView(achievementIsUnlocked: .constant(true))
}

struct BallView: View {
    let color: Color
    
    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .stroke(.fill, lineWidth: 1)
            .shadow(color: color, radius: 4)
            .frame(width: 30, height: 30)

        }
    }
}
