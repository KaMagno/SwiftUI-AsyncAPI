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
            ///Se a lista é vazia apresenta um botão
            if self.memeListObservable.memes.isEmpty {
                PressMeButton {
                    self.memeListObservable.loadMemes()
                    self.showLoader.toggle()
                }
            
            ///Se a lista não é vazia apresenta a uma list de MemeCell.
            }else{
                MemeListView(memeList: self.memeListObservable.memes)
                    .onAppear(perform: {
                        self.showLoader.toggle()
                    })
            }
            
            ///Apresenta o Loader se for necessário
            if self.showLoader {
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
