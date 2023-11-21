//
//  ViewController.swift
//  DeleteImageCollectionsiOS
//
//  Created by My Mac on 21/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let imageViewModel = ImagesDataViewModel()
    
    var index:Int!
    
    var counterId = 12
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    @IBAction func addImageAction(_ sender: Any) {
        counterId += 1
        imageViewModel.imagesList.append(
            ImageModel(id: counterId, imageName:imageViewModel.images.randomElement()!)
        )
        collectionView.reloadData()
    }
    
}

extension ViewController:UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imageViewModel.imagesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath
        ) as! ImageCollectionViewCell
        cell.deleteImageDelegate = self
        cell.setCellImage(cellImage:  imageViewModel.imagesList[indexPath.row])
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewCellWidth = collectionView.bounds.width - 20
        return CGSize(width: collectionViewCellWidth/3, height: collectionViewCellWidth/3)
    }
}

extension ViewController: DeleteImageProtocol{
    func deleteImage(imageId: Int) {
        if imageViewModel.imagesList.contains(where: {$0.id == imageId}){
            index = imageViewModel.imagesList.firstIndex{$0.id == imageId}
            if let index = index {
                imageViewModel.imagesList.remove(at: index)
                print("image id : \(imageId) -- index : \(index)")
                
                collectionView.reloadData()
            }
        }
    }
}
