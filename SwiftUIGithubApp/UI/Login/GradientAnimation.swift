//
//  GradientAnimation.swift
//  SwiftUIDemoApp
//
//  Created by Joshua on 2022/7/1.
//

import SwiftUI

struct GradientDirectionAnimation: View {
    @State private var animateGradient = false
    var body: some View {
        LinearGradient(colors: [.purple, .yellow], startPoint: animateGradient ? .topLeading : .bottomLeading, endPoint: animateGradient ? .bottomTrailing : .topTrailing)
            .ignoresSafeArea()
            .onAppear {
                withAnimation(.linear(duration: 2.0).repeatForever(autoreverses: true)) {
                    animateGradient.toggle()
                }
            }
    }
}

struct GradientHueRotationAnimation: View {
    @State private var animateGradient = false
    var body: some View {
        LinearGradient(colors: [.purple, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing)
            .hueRotation(.degrees(animateGradient ? 45 : 0))
            .ignoresSafeArea()
            .onAppear {
                withAnimation(.easeInOut(duration: 5.0).repeatForever(autoreverses: true)) {
                    animateGradient.toggle()
                }
            }
    }
}

struct RadialGradientAnimation: View {
    @State private var animateGradient = false
    var body: some View {
        RadialGradient(colors: [.purple, .yellow], center: .center, startRadius: animateGradient ? 400 : 200, endRadius: animateGradient ? 20 : 40)
            .ignoresSafeArea()
            .onAppear {
                withAnimation(.linear(duration: 2.0).repeatForever(autoreverses: true)) {
                    animateGradient.toggle()
                }
            }
    }
}

struct AnimatableGradientModifier: AnimatableModifier {
    
    let fromGradient: Gradient
    let toGradient: Gradient
    var progress: CGFloat = 0.0
 
    var animatableData: CGFloat {
        get { progress }
        set { progress = newValue }
    }
 
    func body(content: Content) -> some View {
        var gradientColors = [Color]()
 
        for i in 0..<fromGradient.stops.count {
            let fromColor = UIColor(fromGradient.stops[i].color)
            let toColor = UIColor(toGradient.stops[i].color)
 
            gradientColors.append(colorMixer(fromColor: fromColor, toColor: toColor, progress: progress))
        }
 
        return LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    func colorMixer(fromColor: UIColor, toColor: UIColor, progress: CGFloat) -> Color {
            guard let fromColor = fromColor.cgColor.components else { return Color(fromColor) }
            guard let toColor = toColor.cgColor.components else { return Color(toColor) }
     
            let red = fromColor[0] + (toColor[0] - fromColor[0]) * progress
            let green = fromColor[1] + (toColor[1] - fromColor[1]) * progress
            let blue = fromColor[2] + (toColor[2] - fromColor[2]) * progress
     
            return Color(red: Double(red), green: Double(green), blue: Double(blue))
    }
}

extension View {
    func animatableGradient(fromGradient: Gradient, toGradient: Gradient, progress: CGFloat) -> some View {
            self.modifier(AnimatableGradientModifier(fromGradient: fromGradient, toGradient: toGradient, progress: progress))
    }
}

struct AnimatableGradients: View {
    @State private var progress: CGFloat = 0
    let gradient1 = Gradient(colors: [.purple, .yellow])
    let gradient2 = Gradient(colors: [.blue, .purple])
 
    var body: some View {
 
        Rectangle()
            .animatableGradient(fromGradient: gradient1, toGradient: gradient2, progress: progress)
            .ignoresSafeArea()
            .onAppear {
                withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
                    self.progress = 1.0
            }
        }
    }
}



struct GradientAnimation: View {
    var body: some View {
        ZStack {
            AnimatableGradients()
            ParticlesView()
                .ignoresSafeArea()
            Text("Hello World!")
                .font(Font.system(.headline, design: .serif))
                
        }
    }
}

struct GradientAnimation_Previews: PreviewProvider {
    static var previews: some View {
        GradientAnimation()
    }
}
