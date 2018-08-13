//
//  TextCellModel.swift
//  nemo
//
//  Created by Andyy Hope on 22/7/18.
//  Copyright © 2018 Andyy Hope. All rights reserved.
//

import UIKit

final class TextCellModel {
    
    // MARK: - Properties
    
//    var state: ViewState
    private let entity: TextCellEntity
    
    
    // MARK: - Initializer
    
    init(entity: TextCellEntity) {
        self.entity = entity
    }
    
    
    // MARK: - Computed Properties
    
    var headingLabelText: String {
        return entity.text
    }
    
    var backgroundColor: UIColor {
        if let color = entity.backgroundColor{
            return .color(forColor: color)
        }
        else {
            return .defaultBackgroundColor
        }
    }
}
//
//extension TextCellModel: ViewStateManageable {
//    enum ViewState {
//        case <#state 1#>, <#state 2#>
//    }
//}
