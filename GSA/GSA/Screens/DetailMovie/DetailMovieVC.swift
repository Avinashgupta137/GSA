//
//  DetailMovieVC.swift
//  GSA
//
//  Created by IPS-177  on 20/02/24.
//

import UIKit
import Kingfisher

class DetailMovieVC: UIViewController {
    
    var searchResult: Search?
    @IBOutlet weak var movieIMg: UIImageView!
    @IBOutlet weak var movieImg2: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var rateLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func btnBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func updateUI(){
        if let posterURL = URL(string: searchResult!.poster) {
            movieIMg.kf.setImage(with: posterURL)
            movieImg2.kf.setImage(with: posterURL)
        }
        titleLbl.text = searchResult?.title
        rateLbl.text = searchResult?.imdbID
        yearLbl.text = searchResult?.year
        typeLbl.text = "\(searchResult!.type)"
    }
}
