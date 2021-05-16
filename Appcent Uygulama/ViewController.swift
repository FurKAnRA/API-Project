//
//  ViewController.swift
//  Appcent Uygulama
//
//  Created by Furkan Kara on 10.05.2021.
//

import UIKit
import Foundation


class ViewController: UIViewController , UISearchControllerDelegate , UISearchBarDelegate{
   
    
  
    
    var games = [game]()
    var filteredData : [game]!
    let ima =  UIImageView()
    

    
  
    

    @IBOutlet weak var collectionView2: UICollectionView!
    @IBOutlet weak var collectionView: UICollectionView!

   let searchBarController = UISearchController()
  
    @IBOutlet weak var searchBar: UISearchBar!
    
    var favoritevc = FavoritesViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        title = "Games"
        searchBar.delegate = self
        
       
        
        
        filteredData = games
        
    
        
        getData()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView2.dataSource = self
        collectionView2.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        collectionView2.collectionViewLayout = UICollectionViewFlowLayout()
        if let layout = collectionView2.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
       
        
        
        
        

  
    }
    


    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        let text = searchText
        if (text.count < 3 ){
                    filteredData = games
          
                }
        if (text.count >= 3){
                    filteredData = []
                    for a in 0 ... games.count - 1 {
                        if(games[a].gameName.lowercased().contains(text.lowercased())){
                            filteredData.append(games[a])
                        }
        
        
                    }
                }
        self.collectionView.reloadData()
        self.collectionView2.reloadData()
    }
  

  

    func getData() {
        
        games.removeAll()
       filteredData.removeAll()
        
        
      
       
        DispatchQueue.main.async
        {
            let gamesUrlString = "https://api.rawg.io/api/games?key=25cd72109c064d6e95f41ebbdee66f17"
            
             let request : URLRequest = URLRequest(url: URL(string: gamesUrlString)!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
           
             let session = URLSession.shared
        
            let _: Void = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                
               
                do {
                         let json = try JSONSerialization.jsonObject(with: data!) as! NSDictionary
                            
                        
                        if let resultsArray = json.object(forKey: "results") as? [[String : Any]]
                         {
                                for dic in resultsArray
                                {
                                    
                                    self.games.append(game(dic))
                                    self.filteredData.append(game(dic))
                               
                                }
                            DispatchQueue.main.async
                            {
                                self.collectionView.reloadData()
                                self.collectionView2.reloadData()
                            }
                         
                        }
                         


                     }
                        catch
                     {
                         print("error")
                     }
        


             }).resume()

        }
    }
       
   
    
    
  
}


extension ViewController : UICollectionViewDataSource


{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if(collectionView == collectionView2 ){
            return 3
        }
        
        if(filteredData.count == games.count){
            return filteredData.count - 3
        }
        else{
            return filteredData.count
        }
       
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
      
            if(collectionView == collectionView2 ){
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
                DispatchQueue.main.async {
                    
                    if(self.games.count > 0 )  {
                        cell.imageCell.load(urlString: self.games[indexPath.row].image)
                    }
                }
                
                
               
                return cell
                
            }
        
     
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCollectionViewCell", for: indexPath) as! GameCollectionViewCell
     
        
       
   
        DispatchQueue.main.async
    {
            
           
            if(self.filteredData.count == self.games.count)
            {
                
                
                cell.gameNameLabel.text = self.filteredData[indexPath.row + 3 ].gameName
                cell.gameReleasedDateLabel.text = (" \(self.filteredData[indexPath.row + 3].rating) - \(self.filteredData[indexPath.row + 3].releasedDate) ")
                cell.gameİmageView.load(urlString: self.filteredData[indexPath.row + 3].image)
            }
            else{
                cell.gameNameLabel.text = self.filteredData[indexPath.row ].gameName
                cell.gameReleasedDateLabel.text = (" \(self.filteredData[indexPath.row  ].rating) - \(self.filteredData[indexPath.row].releasedDate) ")
                cell.gameİmageView.load(urlString: self.filteredData[indexPath.row ].image)
            }
           
            
    }
    
      
        
      
        return cell
}
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let description : DescriptionViewController  = self.storyboard?.instantiateViewController(identifier:  "DescriptionVC") as! DescriptionViewController
        
            if(collectionView == collectionView2)
            {
                DispatchQueue.main.async {
                    print(indexPath.row)
                description.getText(id:self.games[indexPath.row].gameId,Name: self.games[indexPath.row].gameName,releasedDate: self.games[indexPath.row].releasedDate, rating : self.games[indexPath.row].rating,url: self.games[indexPath.row ].image)
            }
        }
        
        if(collectionView == collectionView){
            if(self.filteredData.count == self.games.count)
            {
                description.getText(id: self.filteredData[indexPath.row + 3].gameId,Name: self.filteredData[indexPath.row + 3].gameName,releasedDate: self.filteredData[indexPath.row + 3].releasedDate,rating : self.filteredData[indexPath.row + 3].rating,url: self.filteredData[indexPath.row + 3 ].image)
            }
            else{
                    description.getText(id:self.filteredData[indexPath.row].gameId,Name: self.filteredData[indexPath.row].gameName,releasedDate: self.filteredData[indexPath.row].releasedDate, rating : self.filteredData[indexPath.row].rating,url: self.filteredData[indexPath.row ].image)
            }
        }
   
        
        
        
        
       
            
            
            self.navigationController?.pushViewController(description, animated: true)
    }
    

 
    
    
   


}


extension ViewController : UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if(collectionView == collectionView2){
            
            return CGSize(width: self.collectionView2.bounds.width, height: self.collectionView2.bounds.height)
        }
        
        
        return CGSize(width: 400, height: 100)
    
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if(collectionView == collectionView2){
            return 0
        }

        return 10
    }


}


extension UIImageView{
    
    func load(urlString : String){
        
        image = nil
        let url = URL(string: urlString)!
        URLSession.shared.dataTask(with: url, completionHandler: { (data, respones, error) in
            
            if error != nil {
                print(error ?? "")
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
            
        }).resume()
        
       
        

    }
}

