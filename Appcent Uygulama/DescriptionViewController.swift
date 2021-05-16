//
//  DescriptionViewController.swift
//  Appcent Uygulama
//
//  Created by Furkan Kara on 14.05.2021.
//

import UIKit

class DescriptionViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var releasedLabel: UILabel!
    @IBOutlet weak var metacriticLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var gameImage: UIImageView!

   

    
    
    
  
    
    var favoritevc = FavoritesViewController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.setImage(UIImage(systemName : "star"), for: .normal)
        button.addTarget(self, action:#selector(favoriteButtonTapped), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItems = [barButton]
      
      
        }
    @objc func favoriteButtonTapped(){
        
        showMessage(message: "Added to favorites")
        
        
        
      
        
    }
 
       
      
    
    func getText(id : Int,Name : String, releasedDate : String, rating : Double , url : String){
       
        DispatchQueue.main.async {
            let gamesUrlString = "https://api.rawg.io/api/games/\(id)?key=25cd72109c064d6e95f41ebbdee66f17"
            
            
             let request : URLRequest = URLRequest(url: URL(string: gamesUrlString)!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
           
             let session = URLSession.shared
        
            let _: Void = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                
                DispatchQueue.main.async {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!) as! NSDictionary
                           
                       
                        
                       if let description = json.object(forKey: "description")
                        {
                           let string = description as? String ?? ""
                           let regulatedString = string.replacingOccurrences(of: "<p>", with: "")
                            let regulatedString2 = regulatedString.replacingOccurrences(of: "<br />", with: "")
                           let regulatedString3 = regulatedString2.replacingOccurrences(of: "</p>", with: "")
                           
                            
                           self.descriptionLabel.text = ("Description : \(regulatedString3)")
                           self.gameImage.load(urlString: url)
                           self.nameLabel.text = (Name)
                           self.releasedLabel.text = (releasedDate)
                           
                           
                       
                       }
                        if let metacritic = json.object(forKey: "metacritic")
                         {
                    
                            self.metacriticLabel.text = ("Metacritic Rate : \(metacritic)")

                        
                        }
                        


                    } catch {
                        print("error")
                    }
                }
                    
                
                 
                 

                 



             }).resume()

        }
        
    }
    
   

}



extension UIViewController {
    func showMessage(message: String) {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        
        let toastLbl = UILabel()
        toastLbl.text = message
        toastLbl.textAlignment = .center
        toastLbl.font = UIFont.systemFont(ofSize: 18)
        toastLbl.textColor = UIColor.white
        toastLbl.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLbl.numberOfLines = 0
        
        
        let textSize = toastLbl.intrinsicContentSize
        let labelHeight = ( textSize.width / window.frame.width ) * 30
        let labelWidth = min(textSize.width, window.frame.width - 40)
        let adjustedHeight = max(labelHeight, textSize.height + 20)
        
        toastLbl.frame = CGRect(x: 20, y: (window.frame.height - 90 ) - adjustedHeight, width: labelWidth + 20, height: adjustedHeight)
        toastLbl.center.x = window.center.x
        toastLbl.layer.cornerRadius = 10
        toastLbl.layer.masksToBounds = true
        
        window.addSubview(toastLbl)
        
        UIView.animate(withDuration: 3.0, animations: {
            toastLbl.alpha = 0
        }) { (_) in
            toastLbl.removeFromSuperview()
        }
        
        
        
        
        
        
        
        
        
        
        
    }
}





