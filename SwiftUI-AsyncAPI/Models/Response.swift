//
//  Result.swift
//  SwiftUI-AsyncAPI
//
//  Created by Kaique Magno Dos Santos on 13/08/19.
//  Copyright © 2019 Kaique Magno Dos Santos. All rights reserved.
//

import Foundation

struct Response:Decodable {
    let success: Bool
    let errorMessage: String?
    let data:Memes?
}
