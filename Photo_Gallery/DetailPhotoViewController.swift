//
//  DetailPhotoViewController.swift
//  Photo_Gallery
//
//  Created by David Gunawan on 30/03/22.
//

import UIKit

class DetailPhotoViewController: UITableViewController {
    
    var people = [
        "Antonov", "Zielinsky", "Philips", "Viona", "Byo"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        people.shuffle()
    }
    
    var imageName = ""
    
    // MARK: - Table view receive data
    func initData(product: ProductModel) {
        self.navigationItem.title = product.photoTitle
        self.imageName = product.photoImage
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        cell.textLabel?.text = people[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeaderLabelView = UIView()
        let sectionHeaderImage = UIImage(named: imageName)
        let sectionHeaderImageView = UIImageView(image: sectionHeaderImage)
        sectionHeaderImageView.contentMode = .scaleToFill
        sectionHeaderImageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 240)
        sectionHeaderLabelView.addSubview(sectionHeaderImageView)
        return sectionHeaderLabelView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 240
    }
    
}
