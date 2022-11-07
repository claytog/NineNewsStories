//
//  ArticlesServiceProtocol.swift
//  NineNewsStories
//
//  Created by Clayton Gilbert on 10/10/22.
//

import Foundation

protocol ArticlesServiceProtocol {
    func getArticles(completion: @escaping (_ success: Bool, _ results: Article?, _ error: String?) -> ())
}

class ArticlesService: ArticlesServiceProtocol {
    
    let webserviceURL = "https://bruce-v2-mob.fairfaxmedia.com.au/1/coding_test/13ZZQX/full"
    
    func getArticles(completion: @escaping (Bool, Article?, String?) -> ()) {
        HttpRequestHelper().GET(url: webserviceURL, params: ["": ""], httpHeader: .application_json) { success, data in
            if success {
                do {
                    
                    if let JSONString = String(data: data!, encoding: String.Encoding.utf8) { // print JSON
                        print(JSONString)
                    }
                    
                    let model = try JSONDecoder().decode(Article.self, from: data!)
                    completion(true, model, nil)
                } catch DecodingError.dataCorrupted(let context) {
                    print(context)
                } catch DecodingError.keyNotFound(let key, let context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch DecodingError.valueNotFound(let value, let context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch DecodingError.typeMismatch(let type, let context) {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch {
                    print("error: ", error)
                }
            } else {
                completion(false, nil, "Error: Articles GET Request failed")
            }
        }
    }
}
