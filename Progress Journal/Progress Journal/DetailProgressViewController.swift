//
//  DetailProgressViewController.swift
//  Progress Journal
//
//  Created by Minho on 12/11/19.
//  Copyright © 2019 Minho. All rights reserved.
//

import UIKit

class DetailProgressViewController: UIViewController {
    @IBOutlet weak var fullWidthImageView: UIImageView!
    
    var progress: Progress?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageData = progress?.image {
            fullWidthImageView.image = UIImage(data: imageData)
        }
        
        title = progress?.title
    }
}
