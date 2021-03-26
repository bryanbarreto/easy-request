//
//  RequestError.swift
//  
//
//  Created by Bryan Barreto Soares on 26/03/21.
//

import Foundation


public enum RequestError: String, Error {
    case serverError = "Não foi possível se comunicar com servidor"
    case noData = "A requisição não retornou nenhum dado"
    case dataDecodingError = "Erro ao decodificiar dados recebidos do servidor"
}
