//
//  ViewController.swift
//  DeleteImageCollectionsiOS
//
//  Created by My Mac on 21/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let imageVM = NewImageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsMultipleSelection = true
    }
    @IBAction func addImageAction(_ sender: Any) {
        imageVM.addImage()
        collectionView.reloadData()
    }
    @IBAction func deleteSelectedImages(_ sender: Any) {
        print("Selected image deleted")
        collectionView.reloadData()
    }
}

extension ViewController:UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imageVM.imagesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath
        ) as? ImageCollectionViewCell else {
            return .init()
        }
        
        cell.deleteImageDelegate = self
        
        cell.configure(with: imageVM.imagesList[indexPath.row])

        cell.selectImage = { [self] id in
            if let index = imageVM.imagesList.firstIndex(where: { $0.id == id }) {
                self.imageVM.imagesList[index].isSelected.toggle()
                self.collectionView.reloadData()
            }
        }
        
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
    func deleteImage(imageId: String) {
        imageVM.deleteImage(imageId: imageId)
        
        collectionView.reloadData()
    }
}
