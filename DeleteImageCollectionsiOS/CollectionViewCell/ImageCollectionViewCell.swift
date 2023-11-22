//
//  ImageCollectionViewCell.swift
//  DeleteImageCollectionsiOS
//
//  Created by My Mac on 21/11/23.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ImageCollectionViewCell"
    
    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var cellImage: ImageModel!
    
    var deleteImageDelegate: DeleteImageProtocol!
    
    var selectImage: ((String) -> ())?
    
    var isSelect:Bool = false
    
    @IBAction func deleteImageAction(_ sender: Any) {
        deleteImageDelegate.deleteImage(imageId: cellImage.id)
    }
   
    @IBAction func selectImageAction(_ sender: Any) {
        selectImage?(cellImage.id)
        print("iamge seledtedd \(cellImage.id)")
    }
 
    
    func configure(with cellImage: ImageModel) {
        self.cellImage = cellImage
        
        imageView.image = UIImage(named: cellImage.imageName)
        imageView.contentMode = .scaleToFill
        
        selectButton.backgroundColor = cellImage.isSelected ? .yellow : .gray
    }
    
}
