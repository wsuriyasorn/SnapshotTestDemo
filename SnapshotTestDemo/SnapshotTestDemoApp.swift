//
//  SnapshotTestDemoApp.swift
//  SnapshotTestDemo
//
//  Created by Waratnan Suriyasorn on 13.05.24.
//

import SwiftUI

@main
struct SnapshotTestDemoApp: App {
    var body: some Scene {

        WindowGroup {
            NavigationView {
                RequestPriceView()
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Request Guaranteed Price")
                //                ManufacturerView()
                //                    .navigationBarTitleDisplayMode(.inline)
                //                    .navigationTitle("Finde unsere beliebtesten Autos")
            }
        }
    }
}





