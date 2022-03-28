//
//  ViewController.swift
//  Photo_Gallery
//
//  Created by David Gunawan on 25/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    let cellIDs = ["CardCell", "CardCell2", "CardCell3"]
    let cellSizes = Array(repeatElement(CGSize(width:130, height:130), count: 3))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cardCollectionView.delegate = self
        cardCollectionView.dataSource = self
    }
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellIDs.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return cardCollectionView.dequeueReusableCell(withReuseIdentifier: cellIDs[indexPath.item], for: indexPath)
    }
}

extension ViewController: UICollectionViewDelegate{

}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSizes[indexPath.item]
    }
}
