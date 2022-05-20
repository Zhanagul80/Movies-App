//
//  ItemCell.swift
//  Movies
//
//  Created by Zhanagul Tynysbek on 17.04.2022.
//

import UIKit

final class ItemCell: UICollectionViewCell {
    
    @IBOutlet private weak var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with image: UIImage) {
        imageView.image = image
    }
}
