//
//  ViewModifiers.swift
//  WeatherSwiftUI
//
//  Created by Alexandr Onischenko on 06.07.2022.
//

import Foundation
import SwiftUI

struct TitleCity: ViewModifier {
    var color: Color = .white
    var fontSize: CGFloat = 30
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: fontSize, weight: .medium))
            .foregroundColor(color)
    }
}

struct TitleTemp: ViewModifier {
    var color: Color = .white
    var fontSize: CGFloat = 60
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: fontSize))
            .foregroundColor(color)
    }
}

struct Title1: ViewModifier {
    var color: Color = .white
    var fontSize: CGFloat = 20
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: fontSize, weight: .semibold))
            .foregroundColor(color)
    }
}

struct Title2: ViewModifier {
    var color: Color = .white
    var fontSize: CGFloat = 18
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: fontSize, weight: .semibold))
            .foregroundColor(color)
    }
}

struct Title3: ViewModifier {
    var color: Color = .white
    var fontSize: CGFloat = 16
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: fontSize, weight: .semibold))
            .foregroundColor(color)
    }
}




