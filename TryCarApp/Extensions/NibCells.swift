//
//  NibCells.swift
//  TryCarApp
//
//  Created by Eissa on 28/01/2023.
//

import UIKit
import Kingfisher

extension UITableView {
    func registerCell<Cell : UITableViewCell>(cell : Cell.Type){
        let nibName = String(describing: cell.self) // transform classCellName to String
        self.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
    func dequeCell<Cell : UITableViewCell>( cell : Cell) -> Cell {
        let cellID = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withIdentifier: cellID) as? Cell else{fatalError()}
        return cell
    }
}
extension UITableViewCell {
    // MARK: - func of load images wit kingfisher
    func loadCellImages(loadImage: UIImageView, imgURL: String) {
        if imgURL == "" {
            loadImage.image = UIImage(named: "image-4")
        }else{
            //...load img from url
            loadImage.kf.indicatorType = .activity
            let url = URL(string: imgURL)
            loadImage.kf.setImage(with: url)
        }
    }
}

extension UICollectionView {
    func registerCollectionCell<Cell : UICollectionViewCell>(cell : Cell.Type){
        let nibName = String(describing: cell.self) // transform classCellName to String
        self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
    }
    func dequeCell<Cell : UICollectionViewCell>(cell : Cell.Type ,indexPath : IndexPath) -> Cell {
        let cellID = String(describing: Cell.self)
        let cell = self.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? Cell ?? UICollectionView()
        return cell as! Cell
    }
}
extension UICollectionViewCell {
    // MARK: - func of load images wit kingfisher
    func loadCellImages(loadImage: UIImageView, imgURL: String) {
        if imgURL == "" {
            loadImage.image = UIImage(named: "image-4")
        }else{
            //...load img from url
            loadImage.kf.indicatorType = .activity
            let url = URL(string: imgURL)
            loadImage.kf.setImage(with: url)
        }
    }
}
