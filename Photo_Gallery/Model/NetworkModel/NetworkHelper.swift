//
//  NetworkHelper.swift
//  Photo_Gallery
//
//  Created by Jazilul Athoya on 13/04/22.
//

import Foundation

class NetworkHelper {
    
    let baseUrl = "https://api.airtable.com/v0"
    let baseId = "appJQsfippD0ImsS2"
    let tableId = "DummyTable"
    let apiKey = "keyP2VUTPWF7X0WB0"
    
    func getPhotoRecord(onComplete: @escaping (PhotoNetworkModel) -> ()) {
        // check if url is valid
        let recordId = "recM8z0FSZoNSn6FM"
        let stringUrl = "\(baseUrl)/\(baseId)/\(tableId)/\(recordId)"
        guard let url = URL(string: stringUrl) else {
            return
        }
        
        // create request to get data from url
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { data, response, error in
            
            // If error happen, we print the error
            if let error = error {
                print(error.localizedDescription)
            }
            
            // if any data received, we unwrap, then do the operation
            if let data = data {
                // since decoder can return error, we wrap inside docatch
                do {
                    // we decode from data to the class we have defined
                    let decoder = JSONDecoder()
                    let photo = try decoder.decode(PhotoNetworkModel.self, from: data)
                    onComplete(photo)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        // execute the task
        dataTask.resume()
    }
    
}
