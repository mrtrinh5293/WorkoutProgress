//
//  EmptyStateInfoView.swift
//  WorkoutProgress
//
//  Created by duc on 2022-01-21.
//

import SwiftUI

struct EmptyStateInfoView: View {
    
    var image: Image = Image(systemName: "exclamationmark.triangle.fill")
    var title: String = "No Data to Show"
    var message: String = ""
    
    var body: some View {
        VStack {
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .foregroundColor(.secondary)
                .shadow(radius: 10)
            Text(title)
                .font(kPrimaryBodyFont)
                .bold()
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.bottom)
            Text(message)
                .font(kPrimaryCalloutFont)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
    }
}

struct EmptyStateInfoView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateInfoView()
    }
}
