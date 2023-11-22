//
//  ImagesDataResourses.swift
//  DeleteImageCollectionsiOS
//
//  Created by My Mac on 21/11/23.
//

import Foundation

class ImagesDataViewModel {
    
    var imagesList = [ImageModel]()
    
    let images = [
    
        "image1", "image2", "image3", "image4",
        "nimage1", "nimage2", "nimage3", "nimage4",
        "fimage1", "fimage2", "fimage3", "fimage4"
    ]


    func addImages(imageCount:Int){
        for _ in 1...imageCount{
            addImage()
        }
    }
    
    func addImage(){
        self.imagesList.append(
            ImageModel(imageName:self.images.randomElement()!)
        )
    }
    
   
}
