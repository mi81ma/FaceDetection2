//
//  ViewController.swift
//  FaceDetection2
//
//  Created by masato on 24/10/2018.
//  Copyright © 2018 masato. All rights reserved.
//

import UIKit
import Vision

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let image = UIImage(named: "sample1") else
        { return }

        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit

        let scaledHeight = view.frame.width / image.size.width


        imageView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)

//        imageView.backgroundColor = .blue

        view.addSubview(imageView)

        let request = VNDetectFaceRectanglesRequest { (req, err)
            in
            if let err = err {
                print("Failed to detect faces:", err)
                return
            }

            print(req)

            req.results?.forEach({ (res) in
                print(res)

                guard let faceObservation = res as?
                    VNFaceObservation else { return }

                let x = self.view.frame.width * faceObservation.boundingBox.origin.x
                let y = self.view.frame.height * faceObservation.boundingBox.origin.y

                let redView = UIView()
                redView.backgroundColor = .red
                redView.alpha = 0.4
                redView.frame = CGRect(x: x, y: 0, width: 100, height: 100)
                self.view.addSubview(redView)

                print(faceObservation.boundingBox)
            })

        }

        guard let cgImage = image.cgImage else { return }
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        do {
            try handler.perform([request])
        } catch let reqErr {
            print("Failed to perform request:", reqErr)

        }

    }
}
