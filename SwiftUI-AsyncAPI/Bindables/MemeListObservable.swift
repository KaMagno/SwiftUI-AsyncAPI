//
//  MemeListObservable.swift
//  SwiftUI-AsyncAPI
//
//  Created by Kaique Magno Dos Santos on 13/08/19.
//  Copyright © 2019 Kaique Magno Dos Santos. All rights reserved.
//

import Combine
import SwiftUI

final class MemeListObservable: ObservableObject {
    @Published var memes:[Meme] = [Meme]()
    @Published var error:String = String()
    
    func loadMemes() {
        APIManager.getMemes { (result) in
            switch result {
                case .success(let response):
                    DispatchQueue.main.async { [weak self] in
                        guard let self = self else {return}
                        if let data = response.data {
                            self.memes = data.memes
                        }else if let error = response.errorMessage {
                            self.error = error
                        }else{
                            fatalError("API throw something unreadable")
                        }
                    }
                    
                case .failure(let error):
                    print(error)
            }
        }
    }
}
