//
//  DaTaService.swift
//  Requisicao
//
//  Created by Alysson on 09/09/23.
//

import UIKit
// protocolo herda Generic Service = acessando o typeAlias e acessando as propriedades
//  @escaping = func fica alocado na memoria aguardando informação de uma API por ex.
// usamos @escaping para quando estamos utilizando uma função asyncrona ex: a func aguarda os dados da API, no caso do mock nao precisa pois o metodo será sincrono
// @escaping = metodo fica armazenado na memoira e que não perca a referencia, pois não sei quando que ele vai retornar os dados

protocol DataServiceProtocol: GenericService {
    func getDataFromJson(completion: @escaping completion<HomeDataModel?>)
}

class DataService: DataServiceProtocol {
    func getDataFromJson(completion: @escaping completion<HomeDataModel?>) {
        
        //MARK: Leitura de dados -> Mock
        if let url = Bundle.main.url(forResource: "DataMock", withExtension: "json"){  // buscando a rota do arquivo no proprio app
            
            //MARK: Usando o Decoder para transformar os dados do JSON em Objeto Swift
            
            do {
                let data = try Data(contentsOf: url)// converte o json para binario
                let dataModel: HomeDataModel = try JSONDecoder().decode(HomeDataModel.self, from: data)// transforma o binario para objeto
                completion(dataModel, nil)// dando certo ele retorna retorna aqui
            } catch  {
                completion(nil, error) // dando erro retorna aqui
            }
        }
    }
}

//MARK: Ex de MVVM

// HomeScreen -> Storyboard/ XIB/ ViewCode
// Home VC
// HomeViewModel
// HomeService -> OBS: quando necessario
// HomeServiceProtocol
