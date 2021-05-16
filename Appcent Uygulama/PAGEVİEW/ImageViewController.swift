//
//  ImageViewController.swift
//  Appcent Uygulama
//
//  Created by Furkan Kara on 12.05.2021.
//

import UIKit

class ImageViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var image : UIImage!
    var index : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = image
        
        
       
    }
    

}
