//
//  NewImageViewModel.swift
//  DeleteImageCollectionsiOS
//
//  Created by TechnoComet - iOS on 22/11/23.
//

import Foundation

class NewImageViewModel {
    var imagesList = [ImageModel]()
        
    
    let images = [
        
        "image1", "image2", "image3", "image4",
        "nimage1", "nimage2", "nimage3", "nimage4",
        "fimage1", "fimage2", "fimage3", "fimage4"
    ]
    
    init() {
        getImages()
    }
   
    
    func getImages() {
        addImages(imageCount: 50)
    }
    
    func addImages(imageCount:Int){
        for _ in 1...imageCount{
            addImage()
        }
    }
    
    func addImage() {
        self.imagesList.append(
            ImageModel(imageName:self.images.randomElement()!)
        )
    }
    
    
    func deleteImage(imageId:String){
        if self.imagesList.contains(where: {$0.id == imageId}){
            let index = self.imagesList.firstIndex{$0.id == imageId}
            
            if let index = index {
                self.imagesList.remove(at: index)
                print("image id : \(imageId) -- index : \(index)")
              
            }
        }
    }

   
    
}
