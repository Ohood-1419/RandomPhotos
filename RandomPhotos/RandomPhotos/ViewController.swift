//
//  ViewController.swift
//  RandomPhotos
//************************************************
//  Created by ohood Al-harbi on 20/01/1443 AH.
//          ***********(*^*^*)*************
//*************************************************
// The idea of ​​this application is to display random images with the background color changing randomly after pressing the button





import UIKit

class ViewController: UIViewController {
    
    //image
    private let imageViwe:UIImageView = {
        let imageViwe = UIImageView()
        imageViwe.contentMode = .scaleAspectFill
        imageViwe.backgroundColor = .white
        return  imageViwe
        
        
        
        
    }()
    //button
    private let button :UIButton = {
        let button = UIButton()
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        return  button
        
        
        
    }()
    
    
    
    
    let colors: [UIColor] = [
        .systemPink,
        .systemBlue
        ,.systemYellow
     
    
    ]
        


    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.backgroundColor = .systemPink
        view.addSubview(imageViwe)
        imageViwe.frame = CGRect(x: 0, y:0, width: 300, height: 300)
        imageViwe.center = view.center
        view.addSubview(button)
      
        getRandomPhoto()
        
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    
    
    
    
     @objc func didTapButton() {
     getRandomPhoto()
        
        view.backgroundColor = colors.randomElement()
        
    }
    
    
    
    
    
    
    
    //locat button
    override func viewDidLayoutSubviews() {
      
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(x: 30, y:view.frame.height-150-view.safeAreaInsets.bottom, width:view.frame.size.width-60, height: 55)
        
    }
    
    
    
    
    
//to get photo
    func getRandomPhoto()
    {
        let urlString = "https://source.unsplash.com/random/600x600"
        
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else{
            return
        }
        imageViwe.image=UIImage(data:data)
        }
       
    
    
    
    }


