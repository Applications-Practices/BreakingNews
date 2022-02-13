//
//  HeadlinesProvider.swift
//  BreakingNews
//
//  Created by Pablo López Iborra on 13/2/22.
//

import Foundation

class HeadlinesProvider: ApiProvider {
    
    func getSearchHeadlines(search: String, completion: @escaping (_ result: [HeadlineEntity]?) -> ()) {
        self.commonRequest(entity: HeadlineResponse.self, url: R.URLs.getUrlCustomSearch(search: search)!, method: .GET, body: nil, decodingStrategy: .convertFromSnakeCase, completion: { result in
            guard let result = result else { return completion([]) }

            completion(result.articles)
        })
    }
    
    func getHeadlines(countryISO: String, completion: @escaping (_ result: [HeadlineEntity]?) -> ()) {
        self.commonRequest(entity: HeadlineResponse.self, url: R.URLs.getUrlCountryHeadlines(countryISO: countryISO)!, method: .GET, body: nil, decodingStrategy: .convertFromSnakeCase, completion: { result in
            guard let result = result else { return completion([]) }

            completion(result.articles)
        })
    }
    
}

