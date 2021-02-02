//
//  DocumentControl.swift
//  Storyboard-Example
//
//  Created by kantex comsol on 1/29/21.
//  Copyright © 2021 FolioReader. All rights reserved.
//

import UIKit

class DocumentControl: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
    
    //MARK: Private Methods
    
    func setUpView() {
        let width = UIScreen.main.bounds.width
        let heigth = UIScreen.main.bounds.height
        let cover = UIButton()
        cover.setBackgroundImage(UIImage(named: "demo-1"), for: .normal)
        cover.translatesAutoresizingMaskIntoConstraints = false
        cover.heightAnchor.constraint(equalToConstant: heigth/4).isActive = true
        cover.widthAnchor.constraint(equalToConstant: width/3.2).isActive = true
        
//        cover.addTarget(self, action: #selector(imageTapped), for: .touchUpInside)

        addSubview(cover)
    }
    
    @objc func imageTapped() {
        print("Clicked")
        let rootVC = UIViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        
        
        
    }
    
}


