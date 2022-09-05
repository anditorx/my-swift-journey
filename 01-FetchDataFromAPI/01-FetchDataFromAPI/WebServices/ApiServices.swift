//
//  ApiServices.swift
//  01-FetchDataFromAPI
//
//  Created by Armstrong on 05/09/22.
//

import Foundation
import SwiftUI

class ApiServices: ObservableObject {
    @Published var post = [Post]()
    
    init(){
        guard let url = URL(string: "https://picsum.photos/v2/list") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do{
                if let postData = data {
                    let decodedData = try JSONDecoder().decode([Post].self, from: postData)
                    DispatchQueue.main.async{
                        self.post = decodedData
                    }
                }else{
                    print("No data")
                }
            }catch{
                print("Error")
            }
        }.resume()
    }
}
