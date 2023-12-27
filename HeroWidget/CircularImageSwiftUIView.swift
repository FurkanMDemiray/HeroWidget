//
//  CircularImageSwiftUIView.swift
//  HeroWidget
//
//  Created by Melik Demiray on 27.12.2023.
//

import SwiftUI

struct CircularImageSwiftUIView: View {

    var image: Image
    var body: some View {
        image.resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.black, lineWidth: 5))
            .shadow(radius: 10)
    }
}

#Preview {
    CircularImageSwiftUIView(image: Image("batman"))
}
