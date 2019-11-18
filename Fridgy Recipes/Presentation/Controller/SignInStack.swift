//
//  SignInStack.swift
//  Fridgy Recipes
//
//  Created by Сергей on 16.11.2019.
//  Copyright © 2019 Сергей. All rights reserved.
//

import UIKit

class SignInStack: UIView {

    @IBOutlet weak var SignInAppleButton: UIButton!
    @IBOutlet weak var SignInGoogleButton: UIButton!
    @IBOutlet weak var SignInFacebookButton: UIButton!
    @IBOutlet var contentView: UIView!
    
    weak var signInDelegate : SignInDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
       commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
       commonInit()
    }
    
    func commonInit(){
        Bundle.main.loadNibNamed("SignInStack", owner: self, options: nil)
        addSubview(contentView)
                print(self.frame)
              var width = 0

              switch  UIScreen.main.bounds.width {
              case 375 : width = 315
              case 414 : width = 354
              case 320 : width = 260
              default : width = 354

              }

              contentView.frame = CGRect(x: 0, y: 0, width: width, height: 412)
              print(contentView.frame)
              if UIScreen.main.bounds.width >= 768 {
                  contentView.center.x = UIScreen.main.bounds.width/2
              }
        SignInGoogleButton.customCorners()
        SignInAppleButton.customCorners()
        SignInAppleButton.layer.borderWidth = 1
        SignInAppleButton.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)
        SignInFacebookButton.customCorners()
    }
    
    @IBAction func SignWithApple(_ sender: Any) {
        print("Signing with Apple")
    }
    
    @IBAction func SignWithGoogle(_ sender: Any) {
         print("Signing with Google")
    }
    
    @IBAction func SignWithFacebook(_ sender: Any) {
         print("Signing with Facebook")
    }
    @IBAction func EnterAsGuest(_ sender: Any) {
        
        signInDelegate?.EnterAsGuest()
        print("Entered as Guest")
    }
    
}

extension UIButton {
    func customCorners(){
        self.layer.cornerRadius = 5
       
    }
}
