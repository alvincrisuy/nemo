//
//  ImageCarouselCellController.swift
//  nemo
//
//  Created by Andyy Hope on 22/7/18.
//  Copyright © 2018 Andyy Hope. All rights reserved.
//

import UIKit

final class ImageCarouselCellController {
    
    // MARK: - Properties
    
    let model: ImageCarouselCellModel
    let entity: ImageCarouselCellEntity
    
    // MARK: - Initializer
    
    init(entity: ImageCarouselCellEntity) {
        self.entity = entity
        self.model = ImageCarouselCellModel(entity: entity)
    }
    
    // MARK: - Preparation
    
    func prepare(_ cell: ImageCarouselCell) {
        cell.backgroundColor = model.backgroundColor
        cell.imageView.image = model.image
    }
}
