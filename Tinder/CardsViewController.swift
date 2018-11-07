//
//  CardsViewController.swift
//  Tinder
//
//  Created by Joseph Andy Feidje on 11/6/18.
//  Copyright © 2018 Softmatech. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var cardInitialCenter: CGPoint!
    var fadeTransition: FadeTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        cardView.transform = CGAffineTransformIdentity
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func didPanPhoto(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        if sender.state == .began {
            cardInitialCenter = imageView.center
        } else if sender.state == .changed {
            let rotation = CGAffineTransform(rotationAngle: translation.x / 100)
            imageView.transform = rotation
            imageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
        } else if sender.state == .ended {
            if translation.x < 50 {
                UIView.animate(withDuration: 1.0, delay: 0.2, options: [.autoreverse], animations: {
                    self.imageView.center = CGPoint(x: -15000, y: self.cardInitialCenter.y)
                }, completion: nil)
            } else if translation.x > 50 {
                UIView.animate(withDuration: 1.0, delay: 0.2, options: [.autoreverse], animations: {
                    self.imageView.center = CGPoint(x: 15000, y: self.cardInitialCenter.y)
                }, completion: nil)
            } else {
                UIView.animate(withDuration: 1.0, delay: 0.2, options: [.autoreverse], animations: {
                    sender.view?.center = self.cardInitialCenter
                    sender.view?.transform = .identity
                })
                
            }
            
        }
    }
    
    @IBAction func didTapGesture(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "profileSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let profile = segue.destination as! ProfileViewController
        profile.imageValue = imageView.image
        // Set the modal presentation style of your destinationViewController to be custom.
        profile.modalPresentationStyle = UIModalPresentationStyle.custom
        
        // Create a new instance of your fadeTransition.
        fadeTransition = FadeTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        profile.transitioningDelegate = fadeTransition
        
        // Adjust the transition duration. (seconds)
        fadeTransition.duration = 1.0
    }
}
