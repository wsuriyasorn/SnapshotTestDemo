//
//  extension+.swift
//  SnapshotTestDemo
//
//  Created by Waratnan Suriyasorn on 24.06.24.
//

import Foundation
import UIKit

extension Badge {
    var view: UIView {
        let label = UILabel()
        label.font = .italicSystemFont(ofSize: 16)
        label.textColor = .darkGray
        let icon = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        icon.contentMode = .scaleAspectFit
        icon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 20).isActive = true

        switch self {
        case .firstHandCar:
            label.text = " 1. Hand"
            icon.image = .iconOwners
        case .lowMileage:
            label.text = " Wenig Km"
            icon.image = .iconMileage
        case .serviceHistoryMaintain:
            label.text = " Scheckheftgepflegt"
            icon.image = .iconLastService
        }
        return UIStackView(arrangedSubviews: [icon, label])
    }
}

extension Int {

    private var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "€"
        return formatter
    }

    var toPriceString: String {
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}

extension NSAttributedString {

     func withStrikeThrough(_ style: Int = 1) -> NSAttributedString {
         let attributedString = NSMutableAttributedString(attributedString: self)
         attributedString.addAttribute(.strikethroughStyle,
                                       value: style,
                                       range: NSRange(location: 0, length: string.count))
         return NSAttributedString(attributedString: attributedString)
     }
}

extension UIStoryboard {
    func instantiateViewController<T: UIViewController>() -> T {
        instantiateViewController(withIdentifier: String(describing: T.self)) as! T
    }
}
