//
//  ImageModel.swift
//  DeleteImageCollectionsiOS
//
//  Created by My Mac on 21/11/23.
//

import Foundation

struct ImageModel {
    let id: String = UUID().uuidString
    let imageName: String
    var isSelected: Bool = false
}
