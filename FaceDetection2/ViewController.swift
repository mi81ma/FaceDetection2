//
//  ViewController.swift
//  FaceDetection2
//
//  Created by masato on 24/10/2018.
//  Copyright © 2018 masato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let image = UIImage(named: "sample1") else
        { return }

        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit

        let scaledHeight = view.frame.width / image.size.width


        imageView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)

        imageView.backgroundColor = .blue

        view.addSubview(imageView)

    }


}

