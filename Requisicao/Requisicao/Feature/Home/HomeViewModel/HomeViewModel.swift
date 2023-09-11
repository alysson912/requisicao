//
//  HomeViewModel.swift
//  Requisicao
//
//  Created by Alysson on 09/09/23.
//

import UIKit

class HomeViewModel {

    private let service =  DataService()
    
    func fetchData(){ // chamar metodo de request
        service.getDataFromJson { result, failure in
            if let result = result {
                print(result)
            } else {
                print("Deu Ruim !")
            }
                
        }
    }
}
