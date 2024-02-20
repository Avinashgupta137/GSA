//
//  TBCell1CVCell.swift
//  GSA
//
//  Created by IPS-177  on 20/02/24.
//

import UIKit
import Kingfisher

class TBCell1CVCell: UICollectionViewCell {
    @IBOutlet weak var cellImg: UIImageView!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lbl4: UILabel!
    
    func configure(search: Search) {
        if let posterURL = URL(string: search.poster) {
            cellImg.kf.setImage(with: posterURL)
        }
        lbl1.text = search.title
        lbl2.text = "\(search.type)"
        lbl3.text = search.year
        lbl4.text = search.imdbID
    }
    
    
}
