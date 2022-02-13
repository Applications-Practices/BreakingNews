//
//  ApiProvider.swift
//  BreakingNews
//
//  Created by Pablo López Iborra on 13/2/22.
//

import Foundation

class ApiProvider {

    //MARK: Functions
    
    //Create and send generic Request to use with every Model.
    //Return
    //-ModelResponse if request is okey.
    //-Nil if request is invali
    func commonRequest<T: Codable>(entity: T.Type, url:URL, method: R.Requests.METHOD, body: [String:Any]?, decodingStrategy: JSONDecoder.KeyDecodingStrategy?, completion: @escaping (_ data: T?) -> ()) {
        let request = R.Requests.createRequest(url: url, method: method, body: body)
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            if let _ = error {
                completion(nil)
            }
            
            guard let data = data else { return completion(nil) }

            guard let response = R.Requests.genericDecoder(T.self, from: data, decodingStrategy: decodingStrategy) else { return completion(nil) }
            
            completion(response)
        }).resume()
    }
    
}
