//
//  ImageSlideViewController.swift
//  Appcent Uygulama
//
//  Created by Furkan Kara on 16.05.2021.
//

import UIKit

class ImageSlideViewController: UIViewController {

    @IBOutlet weak var gameImage: UIImageView!
    var image = UIImage()
    var index: Int? = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        gameImage.image = image

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
