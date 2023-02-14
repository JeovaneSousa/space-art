//
//  Photo.swift
//  Space Art
//
//  Created by jeovane.barbosa on 29/12/22.
//

import Foundation

class Photo: Codable {

    let title: String?
    let date: String?
    let url: String?
    let hdurl: String?
    let explanation: String?
    let copyright: String?
    
    var isLiked: Bool?
    var isFavorited: Bool?
    
    enum CodingKeys: CodingKey {
        case title,date,url,hdurl,explanation,copyright
    }
    
    func pressedLike(){
        self.isLiked?.toggle()
    }
    
    func pressedFavorited(){
        self.isFavorited?.toggle()
    }
    
}


extension Photo: CustomStringConvertible {
    var description: String {
        return """
\(String(describing: self.url))
\(String(describing: self.hdurl))
\(String(describing: self.title))
\(String(describing: self.explanation))
"""
    }
    
    
}
