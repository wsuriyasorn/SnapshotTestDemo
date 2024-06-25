//
//  SnapshotTestDemoTests.swift
//  SnapshotTestDemoTests
//
//  Created by Waratnan Suriyasorn on 13.05.24.
//

import SwiftUI
import SnapshotTesting
import XCTest

@testable import SnapshotTestDemo

final class SnapshotTests: XCTestCase {

    let storyboard = UIStoryboard(name: "Main", bundle: .main)

    override func setUpWithError() throws {
//        isRecording = true
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func testMainView() {
        let vc: ManufacturerViewController = storyboard.instantiateViewController()

        assertSnapshot(of: vc, as: .image(on: .iPadMini(.landscape)))
    }

    func testCarListView() {
        let vc: CarListViewController = storyboard.instantiateViewController()

        vc.cars = audiCars + bmwCars
        vc.title = "AUDI + BMW"

        assertSnapshot(of: vc, as: .image(on: .iPhone13, size: CGSize(width: 320, height: 1900)))
    }

    func testRequestPriceView() {
        let view = RequestPriceView()

        assertSnapshot(of: UIHostingController(rootView: view), as: .image)
    }

    func testRequestPriceViewError() {
        let view = RequestPriceView(
            value: "12/12/2024",
            value2: "100000",
            showError: true,
            isSubmitButtonEnabled: false
        )

        assertSnapshot(of: UIHostingController(rootView: view), as: .image)
    }
}
