//
//  Repo.swift
//  Storyboard-Example
//
//  Created by kantex comsol on 1/28/21.
//  Copyright © 2021 FolioReader. All rights reserved.
//

import Foundation

struct Repo {
    
    let docs = [Document(id: "1", title: "first", description: "some description", epub: "")]
    
    func getDocuments() -> Array<Document> {
        return docs
    }
}
