//
//  TabViewController.swift
//  Fridgy Recipes
//
//  Created by Сергей on 13.11.2019.
//  Copyright © 2019 Сергей. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

    // makePresentation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard UserDefaults.standard.bool(forKey: "presented") else {
            makePresentation()
            UserDefaults.standard.set(true, forKey: "presented")
            
            return
        }
//        let save = UserDefaults.standard.
//        if save.bool(forKey: "presented") == nil {
            
     
        
        
    }
    
    func makePresentation(){
        let PresentationSB : UIStoryboard? = UIStoryboard(name: "Presentation", bundle: nil)
        if let PageVC = PresentationSB?.instantiateViewController(withIdentifier: "pages") as? PresentationPageViewController{
            PageVC.view.frame = self.view.frame
            self.present(PageVC, animated: false, completion: nil)
        }
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
