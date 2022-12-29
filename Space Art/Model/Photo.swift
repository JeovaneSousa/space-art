//
//  Photo.swift
//  Space Art
//
//  Created by jeovane.barbosa on 29/12/22.
//

import Foundation

struct Photo: Decodable {
    let title: String
    let date: Date
    let url: String
    let hdurl: String
    let explanation: String
    let copyright: String?
}
