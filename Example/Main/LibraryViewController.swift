//
//  LibraryViewController.swift
//  Storyboard-Example
//
//  Created by kantex comsol on 1/28/21.
//  Copyright © 2021 FolioReader. All rights reserved.
//

import UIKit
import FolioReaderKit



class LibraryViewController: UICollectionViewController {
    
    private let reuseIdentifier = "LibraryCell"
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private let itemsPerRow:CGFloat = 3
    
    var largePhotoIndexPath: IndexPath? {
      didSet {
        // 2
        var indexPaths: [IndexPath] = []
        if let largePhotoIndexPath = largePhotoIndexPath {
          indexPaths.append(largePhotoIndexPath)
        }

        if let oldValue = oldValue {
          indexPaths.append(oldValue)
        }
        // 3
//        collectionView.performBatchUpdates({
//          self.collectionView.reloadItems(at: indexPaths)
//        }) { _ in
//          // 4
//          if let largePhotoIndexPath = self.largePhotoIndexPath {
//            self.collectionView.scrollToItem(at: largePhotoIndexPath,
//                                             at: .centeredVertically,
//                                             animated: true)
//            
//          }
//            
//            
//        }
        
        if self.largePhotoIndexPath != nil {
           let storyBord = UIStoryboard(name: "Main", bundle: nil)
            let showVc = storyBord.instantiateViewController(withIdentifier: "bookView")
            showVc.modalPresentationStyle = .fullScreen
            
           
            
            // Do any additional setup after loading the view.
            let bookPath = Bundle.main.path(forResource: "The Silver Chair", ofType: "epub")
            let bookVc = BookViewController(bookPath: bookPath!)
            let nav = UINavigationController(rootViewController: bookVc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
        }
      }
    }

}


extension LibraryViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! LibraryCellView
        
        
        cell.backgroundColor = .black
        cell.bookCover.image = UIImage(named: "demo-2")
        
        return cell
    }
}

extension LibraryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath == largePhotoIndexPath {
         
          var size = collectionView.bounds.size
          size.height -= (sectionInsets.top + sectionInsets.bottom)
          size.width -= (sectionInsets.left + sectionInsets.right)
          return size
        }

        let paddingSpace = sectionInsets.left * (itemsPerRow+1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sectionInsets.left
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(LibraryHeaderView.self)", for: indexPath) as? LibraryHeaderView
            else {
                fatalError("Invalid view type")
            }
            headerView.label.text = "Current Readings"
            return headerView
        default:
            assert(false, "Invalid element type")
        }
    }
    
}


// MARK: - UICollectionViewDelegate
extension LibraryViewController {
  override func collectionView(_ collectionView: UICollectionView,
                               shouldSelectItemAt indexPath: IndexPath) -> Bool {
    if largePhotoIndexPath == indexPath {
      largePhotoIndexPath = nil
    } else {
      largePhotoIndexPath = indexPath
    }

    return false
  }
}
