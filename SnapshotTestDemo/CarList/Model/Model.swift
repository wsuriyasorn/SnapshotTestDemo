//
//  Model.swift
//  SnapshotTestDemo
//
//  Created by Waratnan Suriyasorn on 17.06.24.
//

import Foundation

struct Manufacturer {
    let image: String
    let name: String
    let cars: [Car]
}

struct Car {
    let image: String
    let name: String
    let model: String
    let carDetails: String
    let gear: String
    let consumption: String
    let price: Price
    let badge: [Badge]
}

struct Price {
    let price: Int
    let previousPrice: Int?
    let spareAmount: Int?
    let financingPricePerMonth: Int?

    init(price: Int, previousPrice: Int? = nil, spareAmount: Int? = nil, financingPricePerMonth: Int? = nil) {
        self.price = price
        self.previousPrice = previousPrice
        self.spareAmount = spareAmount
        self.financingPricePerMonth = financingPricePerMonth
    }
}

enum Badge {
    case serviceHistoryMaintain
    case firstHandCar
    case lowMileage
}

// Sample data

var sampleData = [
    Manufacturer(image: "AUDI", name: "AUDI", cars: audiCars),
    Manufacturer(image: "BMW", name: "BMW", cars: bmwCars),
    Manufacturer(image: "FORD", name: "FORD", cars: []),
    Manufacturer(image: "KIA", name: "KIA", cars: []),
    Manufacturer(image: "MERCEDES", name: "MERCEDES", cars: []),
    Manufacturer(image: "MINI", name: "MINI", cars: []),
    Manufacturer(image: "OPEL", name: "OPEL", cars: []),
    Manufacturer(image: "SEAT", name: "SEAT", cars: []),
    Manufacturer(image: "SKODA", name: "SKODA", cars: []),
    Manufacturer(image: "SUBARU", name: "SUBARU", cars: []),
    Manufacturer(image: "TOYOTA", name: "TOYOTA", cars: []),
    Manufacturer(image: "VW", name: "VW", cars: []),
]

var audiCars = [
    Car(image: "car_audi_a1_white", name: "Audi A1", model: "1.0 TFSI", carDetails: "2016 - Benzin - 99,514 km", gear: "Manual", consumption: "97 g CO2/km - 4.4 l/100 km", price: Price(price: 10_960, previousPrice: 13_340, spareAmount: 2_380, financingPricePerMonth: 191), badge: [.serviceHistoryMaintain]),
    Car(image: "car_audi_a3_red", name: "Audi A3", model: "2.0 TDI Ambition", carDetails: "2015 - Diesel - 93,514 km", gear: "Manual", consumption: "106 g CO2/km - 3.8 l/100 km", price: Price(price: 16_820, financingPricePerMonth: 339), badge: [.firstHandCar]),
    Car(image: "car_audi_a7_black", name: "Audi A7", model: "50 TDI quattro", carDetails: "2018 - Diesel - 58,824 km", gear: "Automatic", consumption: "192 g CO2/km - 5.8 l/100 km", price: Price(price: 43_990, financingPricePerMonth: 616), badge: [.lowMileage]),
    Car(image: "car_audi_q3_grey", name: "Audi Q3 Sportback", model: "45 TFSI quattro s line", carDetails: "2021 - Benzin - 39,193 km", gear: "Automatic", consumption: "196 g CO2/km - 7.8 l/100 km", price: Price(price: 40_290, financingPricePerMonth: 654), badge: []),
]

var bmwCars = [
    Car(image: "car_bmw_4er_black", name: "BMW 4er", model: "M440i xDrive", carDetails: "2022 - Benzin - 41,244 km", gear: "Automatic", consumption: "183 g CO2/km - 7.4 l/100 km", price: Price(price: 50_280, financingPricePerMonth: 704), badge: [.lowMileage, .serviceHistoryMaintain]),
    Car(image: "car_bmw_3er_blue", name: "BMW 3er", model: "M340i xDrive", carDetails: "2020 - Benzin - 49,514 km", gear: "Automatic", consumption: "201 g CO2/km - 7.6 l/100 km", price: Price(price: 43_560, financingPricePerMonth: 609), badge: [.firstHandCar, .serviceHistoryMaintain]),
]
