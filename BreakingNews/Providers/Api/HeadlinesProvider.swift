//
//  HeadlinesProvider.swift
//  BreakingNews
//
//  Created by Pablo López Iborra on 13/2/22.
//

import Foundation

class HeadlinesProvider: ApiProvider {
    
    //MARK: Functions
    
    //Request to get headlines by search
    //Return [HeadlineEntity]
    //If request is okey return value.
    //If request is nil return [].
    func getSearchHeadlines(search: String, completion: @escaping (_ result: [HeadlineEntity]?) -> ()) {
        self.commonRequest(entity: HeadlineResponse.self, url: R.URLs.getUrlCustomSearch(search: search), method: .GET, body: nil, decodingStrategy: .convertFromSnakeCase, completion: { result in
            guard let result = result else { return completion([]) }

            completion(result.articles)
        }, failure: { error in
            completion([])
            print("Search error " + error)
        })
    }
    
    //Request to get top-headlines by custom country
    //Return [HeadlineEntity]
    //If request is okey return value.
    //If request is nil return [].
    func getCountryHeadlines(countryISO: String, completion: @escaping (_ result: [HeadlineEntity]?) -> ()) {
        self.commonRequest(entity: HeadlineResponse.self, url: R.URLs.getUrlCountryHeadlines(countryISO: countryISO), method: .GET, body: nil, decodingStrategy: .convertFromSnakeCase, completion: { result in
            guard let result = result else { return completion([]) }

            completion(result.articles)
        }, failure: { error in
            completion([])
            print("Country error " + error)
        })
    }
    
}

