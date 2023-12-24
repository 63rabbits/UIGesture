//
//  ViewController.swift
//  UIGesture
//
//  Created by 63rabbits goodman on 2023/12/24.
//

import UIKit

class ViewController: UIViewController {

    var faceView = FaceView(image: UIImage())
    var messageLabel = UILabel()

    let message = "Operation : 1,2,3 finger Tap. Swipe right to reset."

    override func viewDidLoad() {
        super.viewDidLoad()

        super.viewDidLoad()

        view.addSubview(faceView)
        view.bringSubviewToFront(faceView)

        setupMessage()

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        faceView.center = CGPoint(
            x: UIScreen.main.bounds.width / 2,
            y: UIScreen.main.bounds.size.height / 2
        )
    }

    func setupMessage() {
        messageLabel.text = self.message
        messageLabel.font = UIFont.systemFont(ofSize: 16)
        messageLabel.textAlignment = .center
        messageLabel.sizeToFit()
        messageLabel.removeFromSuperview()
        view.addSubview(messageLabel)

        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        let centerX = messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        let top = messageLabel.topAnchor.constraint(equalTo:  view.topAnchor, constant: 30)
        NSLayoutConstraint.activate([centerX, top])
    }


    
}
