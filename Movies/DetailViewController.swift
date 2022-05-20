//
//  DetailViewController.swift
//  Movies
//
//  Created by Zhanagul Tynysbek on 23.04.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    
    var image: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
    }
}
