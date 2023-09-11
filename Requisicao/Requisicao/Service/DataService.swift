//
//  DaTaService.swift
//  Requisicao
//
//  Created by Alysson on 09/09/23.
//

import UIKit
// protocolo herda Generic Service = acessando o typeAlias e acessando as propriedades
//  @escaping = func fica alocado na memoria aguardando informação de uma API por ex.

protocol DataServiceProtocol: GenericService {
    func getDataFromJson(completion: @escaping completion<HomeDataModel?>)
}

class DataService: DataServiceProtocol {
    func getDataFromJson(completion: @escaping completion<HomeDataModel?>) {
        
        //MARK: Leitura de dados -> Mock
        if let url = Bundle.main.url(forResource: "DataMock", withExtension: "json"){  // buscando a rota do arquivo no proprio app
            
            //MARK: Usando o Decoder para transformar os dados do JSON em Objeto Swift
            
            do {
                let data = try Data(contentsOf: url)
                let dataModel: HomeDataModel = try JSONDecoder().decode(HomeDataModel.self, from: data)// converte o json para binario
                completion(dataModel, nil)
            } catch  {
                completion(nil, error)
            }
        }
    }
}
