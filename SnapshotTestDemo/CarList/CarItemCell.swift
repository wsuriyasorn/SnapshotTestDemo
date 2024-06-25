//
//  CarItemCell.swift
//  SnapshotTestDemo
//
//  Created by Waratnan Suriyasorn on 17.06.24.
//

import UIKit

final class CarItemCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var carDetailsLabel: UILabel!
    @IBOutlet weak var gearTypeLabel: UILabel!
    @IBOutlet weak var consumptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var previousPriceLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var spareAmountLabel: UILabel!
    @IBOutlet weak var pricePerMonthLabel: UILabel!
    @IBOutlet weak var badgeContainer: UIStackView!

    override func prepareForReuse() {
        super.prepareForReuse()
        for view in badgeContainer.subviews {
            view.removeFromSuperview()
        }
    }

    func setupView(with car: Car) {
        imageView.image = UIImage(named: car.image)
//        nameLabel.text = car.name
//        nameLabel.textColor = .systemBlue
//        carDetailsLabel.text = car.carDetails

        priceLabel.text = car.price.price.toPriceString
        priceLabel.textColor = car.price.spareAmount == nil ? .systemBlue : .systemRed
        modelLabel.text = car.model
        gearTypeLabel.text = car.gear
        consumptionLabel.text = car.consumption

        spareAmountLabel.isHidden = car.price.spareAmount == nil
        spareAmountLabel.text = "  Spare \(car.price.spareAmount?.toPriceString ?? "")  "

        previousPriceLabel.isHidden = car.price.previousPrice == nil
        previousPriceLabel.attributedText = NSAttributedString(string: car.price.previousPrice?.toPriceString ?? "").withStrikeThrough()

        pricePerMonthLabel.isHidden = car.price.financingPricePerMonth == nil
        pricePerMonthLabel.text = "ab \(car.price.financingPricePerMonth?.toPriceString ?? "") mtl."

        badgeContainer.isHidden = car.badge.isEmpty
        for badge in car.badge {
            badgeContainer.addArrangedSubview(badge.view)
        }
    }
}
