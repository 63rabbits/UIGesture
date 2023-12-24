//
//  FaceView.swift
//  UIGesture
//
//  Created by 63rabbits goodman on 2023/12/24.
//

import UIKit

class FaceView: UIImageView, UIGestureRecognizerDelegate {

    let normalFace = UIImage(named: "normalFace")
    let smileFace = UIImage(named: "smileFace")
    let angerFace = UIImage(named: "angerFace")
    let laughterFace = UIImage(named: "laughterFace")

    override init(image: UIImage?) {
        super.init(image: image)
        initCommon()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initCommon()
    }

    func initCommon() {
        contentMode = .scaleAspectFit
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.size.height
        let size = (width <= height) ? width : height
        frame = CGRect(x: 0, y: 0, width: size * 0.8 , height: size * 0.8)
        self.image = UIImage(named: "normalFace")

        // MARK: for Gesture

        isUserInteractionEnabled = true
        isMultipleTouchEnabled = true

        let oneFingerTapGesture: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(self.oneFingerTap(_:))
        )
        oneFingerTapGesture.delegate = self
        oneFingerTapGesture.numberOfTouchesRequired = 1     // 1 finger
        oneFingerTapGesture.numberOfTapsRequired = 1        // single tap
        self.addGestureRecognizer(oneFingerTapGesture)

        let twoFingerTapGesture: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(self.twoFingerTap(_:))
        )
        twoFingerTapGesture.delegate = self
        twoFingerTapGesture.numberOfTouchesRequired = 2
        twoFingerTapGesture.numberOfTapsRequired = 1
        self.addGestureRecognizer(twoFingerTapGesture)

        let threeFingerTapGesture: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(self.threeFingerTap(_:))
        )
        threeFingerTapGesture.delegate = self
        threeFingerTapGesture.numberOfTouchesRequired = 3
        threeFingerTapGesture.numberOfTapsRequired = 1
        self.addGestureRecognizer(threeFingerTapGesture)

        let rightSwaipGesture: UISwipeGestureRecognizer = UISwipeGestureRecognizer(
            target: self,
            action: #selector(self.rightSwaip(_:))
        )
        rightSwaipGesture.delegate = self
        rightSwaipGesture.numberOfTouchesRequired = 1       // 1 finger
        rightSwaipGesture.direction = .right                // right swaip
        self.addGestureRecognizer(rightSwaipGesture)

    }

    @objc func oneFingerTap(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            self.image = smileFace
        }
    }

    @objc func twoFingerTap(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            self.image = laughterFace
        }
    }

    @objc func threeFingerTap(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            self.image = angerFace
        }
    }

    @objc func rightSwaip(_ sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            self.image = normalFace
        }
    }


}
