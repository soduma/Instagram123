//
//  ProfileCollectionViewCell.swift
//  Instagram
//
//  Created by 장기화 on 2021/12/22.
//

import UIKit
import SnapKit

class ProfileCollectionViewCell: UICollectionViewCell {
    private let imageView = UIImageView()
    
    func setUp(with image: UIImage) {
        addSubview(imageView)
        imageView.image = UIImage(systemName: "applelogo")
        imageView.tintColor = .random()
        imageView.contentMode = .scaleAspectFit
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}
