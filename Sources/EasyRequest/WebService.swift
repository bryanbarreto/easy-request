//
//  File.swift
//  
//
//  Created by Bryan Barreto Soares on 26/03/21.
//

import Foundation


public class WebService {
    
    public static func addPercentingEncode(to string: String) -> String? {
        return string.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    }

    public func request<T: Codable>(resource: Resource<T>, success: @escaping (T) -> Void, failure: @escaping (RequestError) -> Void){
        self.makeCall(resource: resource) { (result) in
            switch result {
            case .success(let response):
                success(response)
                break
                
            case .failure(let error):
                failure(error)
                break
            }
        }
    }
     
    private func makeCall<T: Codable>(resource: Resource<T>, completion: @escaping (Result<T, RequestError>) -> Void){
        let session = URLSession.shared
        let request = self.buildRequest(resource: resource)
        let task = session.dataTask(with: request) { (data, response, error) in
            print(response.debugDescription)
            if let _ = error {
                completion(.failure(.serverError))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }

            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                
                //debugPrint
                if resource.debugPrint {
                    let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    debugPrint(json)
                }
                
                completion(.success(result))
            } catch {
                completion(.failure(.dataDecodingError))
            }
            
        }
        task.resume()
    }
    
    private func buildRequest<T: Codable>(resource: Resource<T>) -> URLRequest{
        var request = URLRequest(url: resource.url)
        request.httpBody = resource.httpBody
        request.httpMethod = resource.httpMethod.value
        for header in resource.headers {
            let key = header.key
            let value = header.value
            request.addValue(value, forHTTPHeaderField: key)
        }
        return request
    }
}
