//
//  ManufactureItemCell.swift
//  SnapshotTestDemo
//
//  Created by Waratnan Suriyasorn on 17.06.24.
//

import UIKit

final class ManufacturerItemCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    func setupView(with manufacture: Manufacturer) {
        imageView.image = UIImage(named: manufacture.image)
        titleLabel.text = manufacture.name
        imageView.alpha = manufacture.cars.isEmpty ? 0.3 : 1
        titleLabel.textColor = manufacture.cars.isEmpty ? .gray : .systemBlue
    }
}
