//
//  Fonts.swift
//  HW3
//
//  Created by Александр Федоткин on 28.04.2024.
//

import Foundation
import UIKit

enum Fonts {
    static let system14 : [NSAttributedString.Key : Any] = [.font : UIFont.systemFont(ofSize: 14), .foregroundColor : UIColor.white]
    static let system20 : [NSAttributedString.Key : Any] = [.font : UIFont.systemFont(ofSize: 20), .foregroundColor : UIColor.white]
    static let systemBold20 : [NSAttributedString.Key : Any] = [.font : UIFont.boldSystemFont(ofSize: 20), .foregroundColor : UIColor.white]
}
