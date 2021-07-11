//
//  ImageUrlViewModel.swift
//  Landmarks
//
//  Created by niccari on 2021/07/11.
//

import Foundation

final class ImageUrlViewModel: ObservableObject {

    @Published var downloadData: Data? = nil
    let url: String
    
    init(url: String) {
        self.url = url
        self.fetchAsync(url: self.url)
    }
    
    private func fetchAsync(url: String) {
        guard let imageUrl = URL(string: url) else {
            return
        }

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: imageUrl)
            DispatchQueue.main.async {
                self.downloadData = data
            }
        }
    }
}
