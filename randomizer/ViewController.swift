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
    
    private let button: UIButton = {
      let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Generate random image", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        view.addSubview(button)
        getRandomisedPhoto()
        
        button.addTarget(self, action: #selector(onTap), for: .touchUpInside)
    }
    
    @objc func onTap() {
        getRandomisedPhoto()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(
            x: 30,
            y: view.frame.size.height-150-view.safeAreaInsets.bottom,
            width: view.frame.size.width-60,
            height: 50
        )
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

