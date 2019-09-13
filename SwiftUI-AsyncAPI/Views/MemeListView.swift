//
//  MemeListView.swift
//  SwiftUI-AsyncAPI
//
//  Created by kaique.magno.santos on 10/09/19.
//  Copyright © 2019 Kaique Magno Dos Santos. All rights reserved.
//

import SwiftUI

struct MemeListView: View {
    var memeList:[Meme] = [Meme]()
    
    var body: some View {
        List(memeList) { meme in
            MemeCell(dataImage: DataAsyncObservable(urlPath: meme.url), text: meme.name)
        }
    }
}

#if DEBUG
struct MemeListView_Previews: PreviewProvider {
    static var previews: some View {
        MemeListView()
    }
}
#endif
