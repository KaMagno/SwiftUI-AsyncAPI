//
//  MemeCell.swift
//  SwiftUI-AsyncAPI
//
//  Created by Kaique Magno Dos Santos on 13/08/19.
//  Copyright © 2019 Kaique Magno Dos Santos. All rights reserved.
//

import SwiftUI


struct MemeCell: View {
    @ObservedObject var dataImage: DataAsyncObservable
    let text: String?
    
    @ViewBuilder
    var body: some View {
        if dataImage.data.isEmpty {
            LoaderView()
        }else{
            HStack(alignment: .center) {
                VStack(alignment: .center) {
                    Image(uiImage: UIImage(data: dataImage.data) ?? UIImage(imageLiteralResourceName: "Error"))
                        .resizable()
                        .frame(width: 60.0, height: 60.0)
                    text.map({Text($0)})
                }
            }
        }
    }
    
}

#if DEBUG
struct MemeCell_Previews: PreviewProvider {
    static var previews: some View {
        MemeCell(dataImage:DataAsyncObservable(urlPath: "http://www.quickmeme.com/img/19/19936ba17c55d52e24c8b25faa1ba0e95b7819e5ab982963ff16be76721a9791.jpg"), text: nil)
    }
}
#endif
