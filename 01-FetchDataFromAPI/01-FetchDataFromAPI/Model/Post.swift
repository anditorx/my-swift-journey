//
//  Post.swift
//  01-FetchDataFromAPI
//
//  Created by Armstrong on 05/09/22.
//

import Foundation
import SwiftUI

struct Post : Codable, Identifiable {
    public var id: String
    public var author: String
    public var width: Int64
    public var height: Int64
    public var url: String
    public var download_url: String
    
}
