//
//  FavoritesViewController.swift
//  Appcent Uygulama
//
//  Created by Furkan Kara on 15.05.2021.
//

import UIKit



class FavoritesViewController: UIViewController, UICollectionViewDataSource {
 
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var NameText = ""
    var image  = UIImage()
    var released  = ""
    var descriptionText = ""
    var metacritic = ""
  
   
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favorites"
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()

        
      
        
        

        
    }
 
    
    
 
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCollectionViewCell", for: indexPath) as! GameCollectionViewCell
     
        cell.gameİmageView.image = image
        cell.gameNameLabel.text =  NameText
        cell.gameReleasedDateLabel.text  = released
           
        return cell
        }
        

        
       
    
    


}
extension FavoritesViewController : UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {

        return CGSize(width: 400, height: 100)
        
    }
}

