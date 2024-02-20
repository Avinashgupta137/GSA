//
//  MainMovieVC.swift
//  GSA
//
//  Created by IPS-177  on 20/02/24.
//

import UIKit
import Kingfisher

protocol MainMovieVCProtocol : AnyObject  {
    func updateUI()
}

class MainMovieVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel :  MainMovieVCViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MainMovieVCViewModel(view: self)
        viewModel?.viewDidload()
    }
    
}

extension MainMovieVC : MainMovieVCProtocol {
    func updateUI(){
        tableView.reloadData()
    }
}

extension MainMovieVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // Name for each section in the table view
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Featured"
        case 1:
            return "Categories"
        default:
            return nil
        }
    }
    
    // Number of rows in each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows based on the section
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    // Configure cells for each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TBCell1", for: indexPath) as! TBCell1
            guard let cellData = viewModel?.datasource else {
                return UITableViewCell()
            }
            cell.configure(datasource: cellData.search)
            cell.movieBackClosure = { [weak self] movie in
                print(movie)
                self?.goToDetailVC(searchResult:movie)
            }
            return cell
        }else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TBCell2", for: indexPath) as! TBCell2
            guard let cellData = viewModel?.datasource else {
                return UITableViewCell()
            }
            cell.configure(datasource: cellData.search)
            cell.movieBackClosure = { [weak self] movie in
                print(movie)
                self?.goToDetailVC(searchResult:movie)
            }
            return cell
        }
        return UITableViewCell()
    }
    
    
    private func goToDetailVC(searchResult:Search){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailMovieVC") as! DetailMovieVC
        detailVC.searchResult = searchResult
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}



