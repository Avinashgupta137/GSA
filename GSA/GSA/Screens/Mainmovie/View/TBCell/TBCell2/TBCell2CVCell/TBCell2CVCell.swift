//
//  TBCell2CVCell.swift
//  GSA
//
//  Created by IPS-177  on 20/02/24.
//

import UIKit
import Kingfisher

class TBCell2CVCell: UICollectionViewCell {
    @IBOutlet weak var cellImg: UIImageView!
    @IBOutlet weak var cellLbl1: UILabel!
    @IBOutlet weak var cellLbl2: UILabel!
    
    func configure(search: Search) {
        if let posterURL = URL(string: search.poster) {
            cellImg.kf.setImage(with: posterURL)
        }
        cellLbl1.text = search.title
        cellLbl2.text = search.imdbID
    }
}
