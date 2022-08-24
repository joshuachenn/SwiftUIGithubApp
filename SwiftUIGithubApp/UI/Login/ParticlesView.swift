//
//  ParticlesView.swift
//  SwiftUIGithubApp
//
//  Created by Joshua on 2022/7/5.
//

import SwiftUI

struct ParticlesView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let size = CGSize(width: ScreenW, height: ScreenH)
        let host = UIView(frame: CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height))

        let particlesLayer = CAEmitterLayer()
        particlesLayer.frame = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)

        host.layer.addSublayer(particlesLayer)
        host.layer.masksToBounds = true

//        particlesLayer.backgroundColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        particlesLayer.backgroundColor = UIColor.clear.cgColor
        particlesLayer.emitterShape = .rectangle
        particlesLayer.emitterPosition = CGPoint(x: ScreenW/2, y: ScreenH+30)
        particlesLayer.emitterSize = CGSize(width: ScreenW, height: -20)
        particlesLayer.emitterMode = .surface
        particlesLayer.renderMode = .oldestLast
        
        
        
        let shape = EmitterContent.Shape.circle
        let img = shape.image(with: .white.withAlphaComponent(0.5), size: CGSize(width: 180, height: 180)).cgImage
        

        let cell1 = CAEmitterCell()
        cell1.contents = img
        cell1.name = "Bulb"
        cell1.birthRate = 8.0
        cell1.lifetime = 20.0
        cell1.velocity = 59.0
        cell1.velocityRange = -15.0
        cell1.xAcceleration = 5.0
        cell1.yAcceleration = -10.0
        cell1.emissionRange = 180.0 * (.pi / 180.0)
//        cell1.spin = -28.6 * (.pi / 180.0)
//        cell1.spinRange = 57.2 * (.pi / 180.0)
        cell1.emissionLongitude = -CGFloat.pi / 2
        // 粒子发射角度的变化范围
        cell1.emissionRange = CGFloat.pi / 4
        cell1.scale = 0.04
        cell1.scaleRange = 0.3
        cell1.color = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor

        particlesLayer.emitterCells = [cell1]
        return host
    }

    func updateUIView(_ uiView: UIView, context: Context) {
    }

    typealias UIViewType = UIView
}

struct ParticlesView_Previews: PreviewProvider {
    static var previews: some View {
        ParticlesView()
    }
}
