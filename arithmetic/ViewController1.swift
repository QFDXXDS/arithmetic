//
//  ViewController1.swift
//  arithmetic
//
//  Created by Xianxiangdaishu on 2019/7/23.
//  Copyright © 2019 XXDS. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {

    @IBOutlet weak var viewForLayer: UIView!
    var l: CALayer {
        return viewForLayer.layer
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpLayer()
        // Do any additional setup after loading the view.
    }
    
    func setUpLayer() {
        
        l.backgroundColor = UIColor.blue.cgColor
        l.borderWidth = 100.0
        
        l.borderColor = UIColor.red.cgColor
        l.shadowOpacity = 0.7
        l.shadowRadius = 10.0
        
        l.contents = UIImage(named: "180")?.cgImage
        l.contentsGravity = CALayerContentsGravity.center
    }

    
    @IBAction func tapGestureRecognized(sender: UITapGestureRecognizer) {
        l.shadowOpacity = l.shadowOpacity == 0.7 ? 0.0 : 0.7
    }
    
    @IBAction func pinchGestureRecognized(sender: UIPinchGestureRecognizer) {
        
        let offset: CGFloat = sender.scale < 1 ? 5.0 : -5.0
        let oldFrame = l.frame
        
        let oldOrigin = oldFrame.origin
        
        let newOrigin = CGPoint(x: oldOrigin.x + offset, y: oldOrigin.y + offset)
        let newSize = CGSize(width: oldFrame.width + (offset * -2.0), height: oldFrame.height + (offset * -2.0))
        let newFrame = CGRect(origin: newOrigin, size: newSize)
        
        if newFrame.width >= 100.0 && newFrame.width <= 300.0 {
            l.borderWidth -= offset
            l.cornerRadius += (offset / 2.0)
            l.frame = newFrame
        }
        
        
        
        print("111111")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
