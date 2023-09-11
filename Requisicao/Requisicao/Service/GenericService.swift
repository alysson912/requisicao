//
//  GenericService.swift
//  Requisicao
//
//  Created by Alysson on 09/09/23.
//

import Foundation

// tudo relacionado a service

//<T> significa Generic

protocol GenericService: AnyObject {
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}
