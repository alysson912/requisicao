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
    func getDataFromJson(completion: completion<HomeDataModel?>)  // Func sincrona (Mock)
    func getDataFromURLSession(completion: @escaping completion<HomeDataModel?>) // Func Asincrona (URL Session)
}

class DataService: DataServiceProtocol {
    
    //MARK: URL Session
    func getDataFromURLSession(completion: @escaping completion<HomeDataModel?>) {
        let urlString: String = "https://run.mocky.io/v3/cd6455aa-81bc-4f5e-b90f-ac4676cb1f0d" // String
        guard let url = URL(string: urlString) else { return } // Criando URL do tipo URL
        
        var request = URLRequest(url: url)// url Request
        request.httpMethod = "GET" // metodos do protocolo HTTP - >  GET, POST, PUT, DELETE
        let task = URLSession.shared.dataTask(with: request) { data, response, error in // onde faz a requisição e retorna: data = binario, response = detalhes do request, error = error (uso opcional) - Não precisamos usar
            
            guard let dataResult = data else { return }  // retirar o opcional do data
            guard let response = response as? HTTPURLResponse else { return } // pegar statusCode
            
            if response.statusCode == 200 { // verificar se está tudo ok com a requisição ?
                do {
                    
                    let dataModel: HomeDataModel = try JSONDecoder().decode(HomeDataModel.self, from: dataResult) // pega o deta e converte para objeto swift
                    print("SUCCES -> \(#function)")
                    completion(dataModel, nil)// dando certo ele retorna retorna aqui
                } catch  {
                    print("ERROR erro de Parse-> \(#function)") // erro ao converter para HomeDataModel
                    completion(nil, error) // dando erro retorna aqui
                }
                
            } else {    // error
                print("ERROR -> \(#function)")
                completion(nil, error)
            }
            
        }
        task.resume()
    }
    
    //MARK: Leitura de dados -> Mock
    func getDataFromJson(completion:  completion<HomeDataModel?>) {
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
// HomeVC
// HomeViewModel
// HomeService -> OBS: quando necessario
// HomeServiceProtocol
