//
//  CarListViewController.swift
//  SnapshotTestDemo
//
//  Created by Waratnan Suriyasorn on 17.06.24.
//

import UIKit

final class CarListViewController: UICollectionViewController {

    var cars: [Car] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarItemCell", for: indexPath) as? CarItemCell else { return UICollectionViewCell() }
        let car = cars[indexPath.row]
        cell.setupView(with: car)
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cars.count
    }
}
