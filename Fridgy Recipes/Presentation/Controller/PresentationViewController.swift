//
//  PresentationViewController.swift
//  Fridgy Recipes
//
//  Created by Сергей on 13.11.2019.
//  Copyright © 2019 Сергей. All rights reserved.
//

import UIKit

class PresentationViewController: UIViewController, SignInDelegate {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var rotateView: UIView!
    @IBOutlet weak var ViewTitle: UILabel!
    @IBOutlet weak var ViewDescription: UITextView!
    @IBOutlet weak var Stack: UIStackView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var LineView: UIView!
    @IBOutlet weak var SignInStack: SignInStack!
    
    
    var TitleText : String!
    var DescriptionText : String!
    var imageName : String!
    var currentPage : Int!
    var numberOfPages : Int!
    
    var hasupped = false
    
    override func viewDidAppear(_ animated: Bool) {
           if currentPage == 3  && !hasupped{
            Stack.isHidden = true
            SignInStack.isHidden = false
            SignInStack.alpha = 0
        
            UIView.animate(withDuration: 1, animations: upView){
                _ in
                self.SignInStack.alpha = 1
            }
                 hasupped = true
             }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewTitle.text = TitleText
        ViewDescription.text = DescriptionText
        image.image = UIImage(named: imageName)
        
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = currentPage
        pageControl.isUserInteractionEnabled = false
        
        rotateView.transform = rotateView.transform.rotated(by: -(.pi/17))
        if currentPage == 3 {
            ViewTitle.alpha = 0
            ViewDescription.alpha = 0
            LineView.isHidden = true
        }
        self.view.clipsToBounds = true
        SignInStack.signInDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
   
    func EnterAsGuest() {
        self.parent!.dismiss(animated: true, completion: nil)
    }
  
    override func viewDidLayoutSubviews() {
        if hasupped && currentPage == 3{
            upView()
        }
    }
    func upView() -> Void{
        self.rotateView.center.y -= 150
    }

}
