//
//  ImageCollectionViewCell.swift
//  DeleteImageCollectionsiOS
//
//  Created by My Mac on 21/11/23.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ImageCollectionViewCell"
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func deleteImageAction(_ sender: Any) {
        deleteImageDelegate.deleteImage(imageId: cellImage.id)
    }
    
    var cellImage: ImageModel!
    
    var deleteImageDelegate: DeleteImageProtocol!
    
    func setCellImage(cellImage:ImageModel){
        self.cellImage = cellImage
        imageView.image = UIImage(named: cellImage.imageName)
        imageView.contentMode = .scaleToFill
    }
    
}
