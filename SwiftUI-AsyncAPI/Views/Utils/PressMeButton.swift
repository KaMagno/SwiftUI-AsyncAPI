//
//  MainButtonView.swift
//  SwiftUI-AsyncAPI
//
//  Created by kaique.magno.santos on 10/09/19.
//  Copyright © 2019 Kaique Magno Dos Santos. All rights reserved.
//

import SwiftUI

struct PressMeButton: View {
    let action:() -> Void
    
    var body: some View {
        Button(action: action) {
            Text("Press Me")
        }
    }
}

#if DEBUG
struct PressMeButton_Previews: PreviewProvider {
    static var previews: some View {
        PressMeButton {
            print("Worked")
        }
    }
}
#endif
