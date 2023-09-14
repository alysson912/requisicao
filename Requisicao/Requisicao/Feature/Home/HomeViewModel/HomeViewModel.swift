//
//  HomeViewModel.swift
//  Requisicao
//
//  Created by Alysson on 09/09/23.
//

import UIKit

protocol HomeViewModelProtocol: AnyObject { // protocolo para avisar que os dados da api chegaram e em seguida configurar a tableView
    func succes()
    func error(detail: String)
}


class HomeViewModel {

    private let service =  DataService()
    private var data: HomeDataModel?
    
    weak private var delegate:  HomeViewModelProtocol?
    
    public func delegate( delegate: HomeViewModelProtocol?) {
        self.delegate = delegate
    }
    
    func fetchData(){ // chamar metodo de request
        service.getDataFromAlamofire { result, failure in
            if let result = result {
             //   print(result)
                self.data = result // dar vida ao Data para ele nao ser nil
                self.delegate?.succes()
            } else {
                print("Deu Ruim !")
                self.delegate?.error(detail: failure?.localizedDescription ?? "" )
            }
                
        }
    }
    
    public var numberOfRowsInSection: Int {
        return data?.historyAccountList?.count ?? 0
    }
    
    public func loadCurrenDatat(indexPath: IndexPath) -> HistoryAccountList{
        return data?.historyAccountList?[indexPath.row] ?? HistoryAccountList()
    }
}
