//
//  SourceProvider.swift
//  BreakingNews
//
//  Created by Pablo López Iborra on 13/2/22.
//

import Foundation

class SourceProvider: ApiProvider {
    
    //MARK: Functions
    
    //Request to get source headlines
    //Return [SourceEntity]
    //If request is okey return value.
    //If request is nil return [].
    func getSources(completion: @escaping (_ result: [SourceEntity]?) -> ()) {
        self.commonRequest(entity: SourceResponse.self, url: R.URLs.getUrlSources()!, method: .GET, body: nil, decodingStrategy: .convertFromSnakeCase, completion: { result in
            guard let result = result else { return completion([]) }

            completion(result.sources)
        })
    }
    
}
