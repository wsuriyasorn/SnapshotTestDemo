//
//  ManufacturerViewController.swift
//  SnapshotTestDemo
//
//  Created by Waratnan Suriyasorn on 17.06.24.
//

import SwiftUI
import UIKit

struct ManufacturerView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController

    func makeUIViewController(context: Context) -> UIViewControllerType {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let viewController: ManufacturerViewController = sb.instantiateViewController()
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }
}

final class ManufacturerViewController: UICollectionViewController {

    var manufactureList = sampleData

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ManufacturerItemCell", for: indexPath) as? ManufacturerItemCell else { return UICollectionViewCell() }
        let manufacture = sampleData[indexPath.row]
        cell.setupView(with: manufacture)
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let manufacturer = sampleData[indexPath.row]
        performSegue(withIdentifier: "ManufacturerCarList", sender: manufacturer)
    }

    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return !sampleData[indexPath.row].cars.isEmpty
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return manufactureList.count
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ManufacturerCarList", let manufacturer = sender as? Manufacturer {
            let vc = segue.destination as? CarListViewController
            vc?.cars = manufacturer.cars
            vc?.title = manufacturer.name
        }
    }
}
