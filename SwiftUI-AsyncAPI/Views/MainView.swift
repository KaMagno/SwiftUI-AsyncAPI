//
//  MainView.swift
//  SwiftUI-AsyncAPI
//
//  Created by Kaique Magno Dos Santos on 13/08/19.
//  Copyright © 2019 Kaique Magno Dos Santos. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var memeListObservable:MemeListObservable = MemeListObservable()
    @State var showLoader:Bool = false
    
    var body: some View {
        ZStack{
            VStack{
                if !$memeListObservable.memes.isEmpty {
                    List(self.memeListObservable.memes) { meme in
                        MemeCell(dataImage: DataAsyncObservable(urlPath: meme.url), text: meme.name)
                    }
                    .onAppear {
                        self.showLoader.toggle()
                    }
                
                }else{
                    Button(action: {
                        self.memeListObservable.loadMemes()
                        self.showLoader.toggle()
                    }) {
                        Text("Press Me!")
                    }
                }
            }
            if showLoader {
                LoaderView()
            }
        }
    }
}

#if DEBUG
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
#endif
