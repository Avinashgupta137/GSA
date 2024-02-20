//
//  MainMovieVCViewModel.swift
//  GSA
//
//  Created by IPS-177  on 20/02/24.
//

import Foundation

protocol MainMovieVCViewModelProtocol {
    func viewDidload()
    var datasource : Gsamodel? { get set }
}

class MainMovieVCViewModel {
    weak var view : MainMovieVCProtocol?
    var datasource : Gsamodel?
    init(view : MainMovieVCProtocol){
        self.view = view
    }
}

extension MainMovieVCViewModel : MainMovieVCViewModelProtocol {
    func viewDidload(){
        fetchData()
    }
    
    func fetchData(){
        APIHandler.shared.fetchData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let gsamodel):
                print(gsamodel)
                self.datasource = gsamodel
                DispatchQueue.main.async { [weak self] in
                    self?.view?.updateUI()
                }
            case .failure(let error):
                print("Error fetching data: \(error)")
            }
        }
    }
    
}

