//
//  ViewController.swift
//  Project15
//
//  Created by Anthony John Beckner on 12/14/15.
//  Copyright © 2015 ajbeckner. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    @IBOutlet weak var tap: UIButton!
    
    var imageView: UIImageView!
    var button: UIButton!
    var currentAnimation = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView(image: UIImage(named: "penguin"))
        imageView.center = CGPoint(x: 512, y: 384)
        view.addSubview(imageView)
        
    }
    
    @IBAction func tapped(sender: UIButton) {
        translateView(imageView, x: 50, y: 0)
    }
    
    func startMove(){
        let n = GKRandomSource().nextIntWithUpperBound(3)
        switch n{
        case 0:
            translateView(imageView, x: 50*Double(GKRandomSource().nextIntWithUpperBound(5)+1), y: 0)
        case 1:
            rotate(imageView, angle: 90)
            translateView(imageView, x: 50*Double(GKRandomSource().nextIntWithUpperBound(5)+1), y: 0, delay: 1)
        case 2:
            rotate(imageView, angle: 270)
            translateView(imageView, x: 50*Double(GKRandomSource().nextIntWithUpperBound(5)+1), y: 0, delay: 1)
        default:
            print(n,": failed")
        }
        
        print(imageView.center)
    }
    
    func rotate(v:UIView,angle:Double,delay d:Double = 0) {
        UIView.animateWithDuration(1, delay: d, options: [],
            animations: { [unowned self] in
                v.transform = CGAffineTransformRotate(v.transform, CGFloat(angle*M_PI/180))
            }) { [unowned self] (finished: Bool) in
        }
    }
    
    func translateView(v:UIView,x:Double,y:Double,delay d:Double = 0) {
        UIView.animateWithDuration(1, delay: d, options: [],
            animations: { [unowned self] in
                v.transform = CGAffineTransformTranslate(v.transform,CGFloat(x), CGFloat(y))
                v.center.x += v.transform.tx
                v.center.y += v.transform.ty
                v.transform.tx = 0
                v.transform.ty = 0
            }) { [unowned self] (finished: Bool) in
                
        }
    }
}