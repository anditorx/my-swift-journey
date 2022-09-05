//
//  ContentView.swift
//  01-FetchDataFromAPI
//
//  Created by Armstrong on 05/09/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var fetch = ApiServices()
    
    var body: some View {
        List(fetch.post) { post in
            VStack(alignment: .leading){
                Text(post.author).font(.system(size: 24, weight: .bold, design: .rounded))
                AsyncImage(url: URL(string: post.download_url)) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200, maxHeight: 250)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                Button(action: {print("Klik Post ke \(post.id)")}){
                    Text("Read More ... ")
                }
            }.padding(.vertical, 20)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
