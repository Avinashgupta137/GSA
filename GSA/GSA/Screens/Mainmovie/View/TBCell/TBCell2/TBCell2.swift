//
//  TBCell2.swift
//  GSA
//
//  Created by IPS-177  on 20/02/24.
//

import UIKit

class TBCell2: UITableViewCell {
    
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    
    var datasource = [Search]()
    var movieBackClosure: ((Search) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionViewOutlet.delegate = self
        collectionViewOutlet.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    func configure(datasource:[Search]){
        self.datasource = datasource
    }
    
}

extension TBCell2 : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TBCell2CVCell", for: indexPath) as! TBCell2CVCell
        let cellData = datasource[indexPath.row]
        cell.configure(search: cellData)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Handle item selection here
        let selectedData = datasource[indexPath.row]
        movieBackClosure?(selectedData)
    }
    
}
