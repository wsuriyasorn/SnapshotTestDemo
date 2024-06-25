//
//  SnapshotTestDemoTests_Old.swift
//  SnapshotTestDemoTests
//
//  Created by Waratnan Suriyasorn on 21.06.24.
//

import XCTest

@testable import SnapshotTestDemo

final class SnapshotTestDemoTests_Old: XCTestCase {

    let storyboard = UIStoryboard(name: "Main", bundle: .main)
    var sut: CarItemCell?

    override func setUpWithError() throws {
        let carList: CarListViewController = storyboard.instantiateViewController()

        sut = carList.collectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing: CarItemCell.self),
            for: IndexPath(item: 0, section: 0)
        ) as? CarItemCell
    }

    func testCarItemCell_example1() throws {
        guard let sut = sut else { return XCTFail("SUT is empty") }

        let carData = Car(
            image: "car_bmw_4er_black",
            name: "BMW 4er",
            model: "M440i xDrive",
            carDetails: "2022 - Benzin - 41,244 km",
            gear: "Automatic",
            consumption: "183 g CO2/km - 7.4 l/100 km",
            price: Price(price: 50_280, financingPricePerMonth: 704),
            badge: [.lowMileage, .serviceHistoryMaintain]
        )

        sut.setupView(with: carData)

        XCTAssertEqual(sut.imageView.image, UIImage(named: carData.image))
        XCTAssertEqual(sut.nameLabel.text, carData.name)
        XCTAssertEqual(sut.nameLabel.textColor, .systemBlue)
        XCTAssertEqual(sut.priceLabel.text, carData.price.price.toPriceString)
        XCTAssertEqual(sut.priceLabel.textColor, .systemBlue)
        XCTAssertEqual(sut.modelLabel.text, carData.model)
        XCTAssertEqual(sut.gearTypeLabel.text, carData.gear)
        XCTAssertEqual(sut.consumptionLabel.text, carData.consumption)
        // there are more test to cover
    }

    override func tearDownWithError() throws {
        sut = nil
    }
}
