//
//  ViewController.swift
//  Photo_Gallery
//
//  Created by David Gunawan on 25/03/22.
//

import UIKit

enum CardSection: Int {
    case main
}

struct CardImage: Hashable {
    var image: UIImage
    var title: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    typealias DataSource = UICollectionViewDiffableDataSource<CardSection, CardImage>
    typealias Snapshot = NSDiffableDataSourceSnapshot<CardSection, CardImage>
    
    private lazy var dataSource = makeDataSource()
    
    let cardCells = [CardImage(image: UIImage(named: "josue-michel")!, title: "josue-michel"),CardImage(image: UIImage(named: "dim-hou-tim-john")!, title: "dim-hou-tim-john")]
    
    let cellSizes = Array(repeatElement(CGSize(width:130, height:130), count: 2))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cardCollectionView.delegate = self
        applySnapshot(animatingDifferences: false)
    }
    
    func makeDataSource() -> DataSource {
        let dataSource = DataSource(
            collectionView: cardCollectionView,
            cellProvider: { (collectionView, indexPath, card) ->
                UICollectionViewCell? in
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: "CardCell",
                    for: indexPath) as? CardCollectionViewCell
                
                cell?.cellImage.image = self.cardCells[indexPath.item].image
                cell?.cellTitle.text = self.cardCells[indexPath.item].title
                return cell
            })
        return dataSource
    }
    
    func applySnapshot(animatingDifferences: Bool = true) {
        var snapshot = Snapshot()
        snapshot.appendSections([CardSection.main])
        snapshot.appendItems(cardCells, toSection: CardSection.main)
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSizes[indexPath.item]
    }
}
