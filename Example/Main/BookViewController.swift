//
//  IntermediateViewController.swift
//  Storyboard-Example
//
//  Created by kantex comsol on 1/29/21.
//  Copyright © 2021 FolioReader. All rights reserved.
//

import UIKit
import FolioReaderKit

class BookViewController: FolioReaderContainer {

    init(bookPath: String) {
        super.init(withConfig: FolioReaderConfig(), folioReader: FolioReader(), epubPath: bookPath, unzipPath: nil, removeEpub: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
}


