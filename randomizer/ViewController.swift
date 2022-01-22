//
//  ViewController.swift
//  randomizer
//
//  Created by rish on 23/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
      let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemBlue
      return imageView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        getRandomisedPhoto()
    }
    
    func getRandomisedPhoto(){
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else{
            return
        }
        imageView.image = UIImage(data: data)
    }
}

