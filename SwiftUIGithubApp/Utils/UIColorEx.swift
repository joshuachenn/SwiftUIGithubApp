//
//  UIColorEx.swift
//  SwiftUIDemoApp
//
//  Created by Joshua on 2022/7/1.
//

import UIKit

extension UIColor {
    
    func asImage(_ size: CGSize) -> UIImage? {
        
        var resultImage: UIImage? = nil
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            
            return resultImage
        }
        
        context.setFillColor(self.cgColor)
        context.fill(rect)
        resultImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resultImage
    }
}

enum EmitterContent {
    enum Shape {
        case circle
        case triangle
        case square
        case custom(CGPath)
    }

    case shape(Shape, UIColor?)
    case image(UIImage, UIColor?)
    case emoji(Character)
}

extension EmitterContent {
    var color: UIColor? {
        switch self {
        case let .image(_, color?),
             let .shape(_, color?):
            return color
        default:
            return nil
        }
    }

    var image: UIImage {
        switch self {
        case let .image(image, _):
            return image
        case let .shape(shape, color):
            return shape.image(with: color ?? .white)
        case let .emoji(character):
            return "\(character)".image()
        }
    }
}

extension EmitterContent.Shape {
    func path(in rect: CGRect) -> CGPath {
        switch self {
        case .circle:
            return CGPath(ellipseIn: rect, transform: nil)
        case .triangle:
            let path = CGMutablePath()
            path.addLines(between: [
                CGPoint(x: rect.midX, y: 0),
                CGPoint(x: rect.maxX, y: rect.maxY),
                CGPoint(x: rect.minX, y: rect.maxY),
                CGPoint(x: rect.midX, y: 0)
            ])
            return path
        case .square:
            return CGPath(rect: rect, transform: nil)
        case .custom(let path):
            return path
        }
    }

    func image(with color: UIColor, size: CGSize = CGSize(width: 12.0, height: 12.0)) -> UIImage {
        let rect = CGRect(origin: .zero, size: size)
        return UIGraphicsImageRenderer(size: rect.size).image { context in
            context.cgContext.setFillColor(color.cgColor)
            context.cgContext.addPath(path(in: rect))
            context.cgContext.fillPath()
        }
    }
}

fileprivate extension String {
    func image(with font: UIFont = UIFont.systemFont(ofSize: 16.0)) -> UIImage {
        let string = NSString(string: "\(self)")
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font
        ]
        let size = string.size(withAttributes: attributes)

        return UIGraphicsImageRenderer(size: size).image { _ in
            string.draw(at: .zero, withAttributes: attributes)
        }
    }
}
