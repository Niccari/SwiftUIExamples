//
//  UserImage.swift
//  Shared
//
//  Created by niccari on 2021/07/11.
//

import SwiftUI

struct UserImage: View {
    @ObservedObject var viewModel: ImageUrlViewModel

    private func prepareImage() -> Image {
        if let imageData = self.viewModel.downloadData {
            if let image = UIImage(data: imageData) {
                return Image(uiImage: image)
            } else {
                return Image("failed")
            }
        } else {
            return Image("loading")
        }
    }

    var body: some View {
        let image = prepareImage()
        image
            .resizable()
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: 3)
    }
}
