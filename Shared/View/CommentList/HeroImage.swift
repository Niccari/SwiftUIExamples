//
//  HeroImage.swift
//  SwiftUIExamples (iOS)
//
//  Created by niccari on 2021/07/11.
//

import SwiftUI

struct HeroImage: View {
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
        prepareImage().resizable()
    }
}
