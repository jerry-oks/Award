//
//  AwardView.swift
//  Award
//
//  Created by HOLY NADRUGANTIX on 31.10.2023.
//

import SwiftUI

struct AwardView: View {
    let size: Double
    
    @State private var rotationDegrees = 0.0
    @State private var placeholderOpacity = 1.0
    @State private var colorOpacity = 0.0
    @State private var appleOpacity = 0.0
    
    @Binding var achievementIsUnlocked: Bool
    
    private let grayColors = [
        Color(uiColor: .systemGray3),
        Color(uiColor: .darkGray),
        Color(uiColor: .systemGray4),
        Color(uiColor: .lightGray),
        Color(uiColor: .systemGray6),
        Color(uiColor: .darkGray)
    ]
    private let spectreColors = [
        Color.red,
        Color.yellow,
        Color.orange,
        Color.green,
        Color.blue,
        Color.purple,
        Color.red
    ]
    
    private var silverGradient: LinearGradient {
        LinearGradient(
            colors: grayColors,
            startPoint: .bottomLeading,
            endPoint: .topTrailing
        )
    }
    private var silverGradientInverted: LinearGradient {
        LinearGradient(
            colors: grayColors.reversed(),
            startPoint: .bottomLeading,
            endPoint: .topTrailing
        )
    }
    private var colorfulGragient: AngularGradient {
        AngularGradient(
            colors: spectreColors,
            center: .center,
            angle: .degrees(-90)
        )
    }
    
    
    var body: some View {
        
        ZStack {
            BallsView(achievementIsUnlocked: $achievementIsUnlocked)
            ZStack {
                Circle()
                    .fill(silverGradient)
                    .stroke(.gray, lineWidth: 2)
                Circle()
                    .fill(.gray)
                    .stroke(silverGradientInverted, lineWidth: 2)
                    .scaleEffect(0.9)
                ForEach(0..<3) {_ in
                    Circle()
                        .fill(colorfulGragient)
                        .scaleEffect(0.65)
                        .blur(radius: size / 10)
                        .clipShape(.circle)
                        .rotationEffect(.degrees(rotationDegrees))
                        .opacity(colorOpacity)
                }
                Image(systemName: "apple.logo")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(0.4)
                    .offset(x: 0, y: -size / 40)
                    .foregroundStyle(.white)
                    .shadow(color: .white, radius: size / 40)
                    .shadow(color: .white, radius: 0)
                    .opacity(appleOpacity)
                
                
                PlaceholderView(size: size)
                    .opacity(placeholderOpacity)
            }
            .frame(width: size, height: size)
            .onChange(of: achievementIsUnlocked) {
                withAnimation() {
                    placeholderOpacity = 0
                }
                withAnimation(.easeOut(duration: 2).delay(3.2)) {
                    colorOpacity = 1
                }
                withAnimation(.easeOut(duration: 5).delay(5)) {
                    appleOpacity = 1
                }
                withAnimation(.linear(duration: 10).repeatForever(autoreverses: false).delay(5)) {
                    rotationDegrees = 360
                }
            }
        }
    }
}

#Preview {
    AwardView(size: 200, achievementIsUnlocked: .constant(true))
}
