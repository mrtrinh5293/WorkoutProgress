//
//  SwiftUIView.swift
//  WorkoutProgress
//
//  Created by duc on 2022-01-26.
//

import SwiftUI

struct CustomBarButton: View {
    var title: String
    @EnvironmentObject var appSettings: AppSettings
    
    var body: some View {
        Text(title)
            .bold()
            .foregroundColor(.white)
            .padding(10)
            .background(appSettings.themeColorView())
            .frame(height: 30)
            .cornerRadius(15)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CustomBarButton(title: "Save")
    }
}
