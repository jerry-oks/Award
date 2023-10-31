//
//  ContentView.swift
//  Award
//
//  Created by HOLY NADRUGANTIX on 31.10.2023.
//

import SwiftUI
import ConfettiSwiftUI

struct ContentView: View {
    @State private var achievementIsUnlocked = false
    @State private var counter = 0
    
    var body: some View {
        ZStack {
            ConfettiView(counter: $counter)
            
            VStack {
                Spacer()
                
                TitleTextView()
                
                Spacer()
                
                AchievementAwardView(
                    achievementIsUnlocked: $achievementIsUnlocked,
                    counter: $counter)
                
                Spacer()
                
                AchievementTextView(achievementIsUnlocked: $achievementIsUnlocked)
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct ConfettiView: View {
    @Binding var counter: Int
    
    var body: some View {
        ConfettiCannon(
            counter: $counter,
            num: 100,
            confettis: [
                .sfSymbol(symbolName: "apple.logo"),
                .sfSymbol(symbolName: "swift"),
                .sfSymbol(symbolName: "command"),
                .sfSymbol(symbolName: "iphone"),
                .image("Swiftbook")
            ],
            confettiSize: 20,
            rainHeight: UIScreen.main.bounds.height,
            fadesOut: false,
            openingAngle: Angle(degrees: 0),
            closingAngle: Angle(degrees: 360),
            radius: UIScreen.main.bounds.width / 1.5
        )
    }
}

struct TitleTextView: View {
    var body: some View {
        Text("You've got an achievement")
            .frame(height: 50)
            .font(.title)
            .bold()
    }
}

struct AchievementAwardView: View {
    @Binding var achievementIsUnlocked: Bool
    @Binding var counter: Int
    
    var body: some View {
        ZStack {
            if achievementIsUnlocked {
                BallsView()
            }
            
            AwardView(
                size: UIScreen.main.bounds.width / 2,
                achievementIsUnlocked: $achievementIsUnlocked
            )
            .onLongPressGesture {
                if counter == 0 {
                    counter = 1
                }
                achievementIsUnlocked.toggle()
            }
        }
    }
}

struct AchievementTextView: View {
    @Binding var achievementIsUnlocked: Bool
    
    var body: some View {
        Text(achievementIsUnlocked
             ? "iOS-developer (lvl. 1)"
             : "Long pressure to know what it is"
        )
        .frame(height: 50)
        .font(achievementIsUnlocked
              ? .largeTitle
              : .callout
        )
        .bold(achievementIsUnlocked)
        .animation(.smooth.delay(4), value: achievementIsUnlocked)
    }
}
