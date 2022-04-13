//
//  UIImageView + Extension.swift
//  Photo_Gallery
//
//  Created by Jazilul Athoya on 13/04/22.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            guard let data =  try? Data(contentsOf: url), let image = UIImage(data: data) else {
                return
            }
            DispatchQueue.main.async {
                self?.image = image
            }
        }
    }
}
