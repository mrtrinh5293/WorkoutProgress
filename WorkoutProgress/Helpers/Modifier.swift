//
//  Modifier.swift
//  WorkoutProgress
//
//  Created by duc on 2022-02-14.
//

import Foundation
import SwiftUI

struct CustomInfoTextStyle: ViewModifier {
    var appSettings: AppSettings
    var opacity: Double = 0.2
    var foregroundColor: Color = .secondary
    
    func body(content: Content) -> some View {
        content
            .font(kPrimaryCaptionFont)
            .foregroundColor(foregroundColor)
            .padding([.leading, .trailing], 10)
            .padding([.top, .bottom], 5)
            .background(appSettings.themeColorView().opacity(opacity))
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
    }
}
