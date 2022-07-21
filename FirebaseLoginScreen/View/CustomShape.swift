//
//  CustomShape.swift
//  FirebaseLoginScreen
//
//  Created by Bhumika Patel on 21/07/22.
//

import SwiftUI

struct CustomShape : Shape {
    var corner : UIRectCorner
    var radii : CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radii, height: radii))
        
        return Path(path.cgPath)
    }
}

//struct CustomShape_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomShape()
//    }
//}
