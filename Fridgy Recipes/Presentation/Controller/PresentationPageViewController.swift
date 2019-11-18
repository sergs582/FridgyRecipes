//
//  PresentationPageViewController.swift
//  Fridgy Recipes
//
//  Created by Сергей on 13.11.2019.
//  Copyright © 2019 Сергей. All rights reserved.
//

import UIKit

class PresentationPageViewController: UIPageViewController {
    
    

    let titlesArray : [String] = ["Restaurants", "Bistro", "Home", "Registration"]
    let DescriptionArray : [String] = [
        "There are many ways food makes people happy and one of the worthiest is a tour that has been described as the food lover’s dream.",
        "Everyone loves good, old fashioned charcoal grilling. It adds a raw, distinctive taste to your sausages, burgers, ribs, and other grilled items.",
        "Many people understand the concept of passive solar for heating a home. Fewer realize it can be used in to cook food and sterilize water.", "Sign in with apple"]
    let imagesArray : [String] = ["restaurants", "bistro", "home", "home"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        if let presentationVC = showViewControllerAtIndex(0){
            setViewControllers([presentationVC], direction: .forward, animated: true, completion: nil)
        }
      
    }
    
    
    func showViewControllerAtIndex(_ index : Int)-> PresentationViewController?{
        guard index >= 0 else{
            return nil
        }
        
        guard index < titlesArray.count else{ return nil}
        
        guard let presentationVC = storyboard?.instantiateViewController(withIdentifier: "presentation") as? PresentationViewController else {
            return nil
        }
        presentationVC.TitleText = titlesArray[index]
        presentationVC.DescriptionText = DescriptionArray[index]
        presentationVC.imageName = imagesArray[index]
        presentationVC.currentPage = index
        presentationVC.numberOfPages = titlesArray.count
        presentationVC.view.frame = self.view.frame
        
        return presentationVC

    }
    
  

}


extension PresentationPageViewController : UIPageViewControllerDataSource{
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var pageNumber = (viewController as! PresentationViewController).currentPage
        pageNumber! -= 1
        return showViewControllerAtIndex(pageNumber!)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var pageNumber = (viewController as! PresentationViewController).currentPage
        pageNumber! += 1
        return showViewControllerAtIndex(pageNumber!)
        
    }
}

