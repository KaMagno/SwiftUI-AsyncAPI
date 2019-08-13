//
//  LoaderView.swift
//  SwiftUI-AsyncAPI
//
//  Created by Kaique Magno Dos Santos on 13/08/19.
//  Copyright © 2019 Kaique Magno Dos Santos. All rights reserved.
//

import SwiftUI

struct LoaderView: View {
    @State var angle = Angle(degrees: 0)
    
    var animation: Animation {
        Animation.linear(duration: 1.5).repeatForever(autoreverses: false)
    }
    
    var body: some View {
        VStack{
            Image(uiImage: UIImage(imageLiteralResourceName: "Loading"))
                .resizable()
                .frame(width: 80.0, height: 80.0)
                .animation(animation)
                .rotationEffect(angle)
                .onAppear {
                    self.angle = Angle(degrees: 360.0)
                }
        }
    }
}

#if DEBUG
struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
#endif
