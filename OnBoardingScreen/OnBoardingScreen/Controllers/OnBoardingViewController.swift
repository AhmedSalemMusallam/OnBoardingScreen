//
//  OnBoardingViewController.swift
//  OnBoardingScreen
//
//  Created by Ahmed Salem on 06/01/2023.
//

import UIKit

class OnBoardingViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var loginButton:UIButton!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var BoardingCollectionView: UICollectionView!
    
    
    
    
    // MARK: - Varaibels
    let titleArray = [
    "Sleep Mood",
    "Calm & Peace",
    "Nice Place"
    ]
    
    let subTitleArray = [
    "Sleeping well is very important for every one",
    "Clam & Pease is also very important",
    "Nice Places are also very important",
    ]
    
    let imageArray =
    [
        ImageHelper.image_1,
        ImageHelper.image_2,
        ImageHelper.image_3,
    
    ]
//    BoardingCollectionView.delegate = self
//    BoardingCollectionView.dataSource = self
  
    

    
    
}

// MARK: - View Life Cycle
extension OnBoardingViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        //Adding Some Custom Styles
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = DarkColor?.cgColor
        
        // Do any additional setup after loading the view.
    }
}

// MARK: - IBActions
extension OnBoardingViewController{
    @IBAction func skipButtonAction(_ sender: UIButton) {
        print("Skip")
    }
    
     @IBAction func signUpButtonAction(_ sender: UIButton) {
         print("sign")
     }
     

     @IBAction func loginButtonAction(_ sender: UIButton) {
         print("Login")
     }
     
    @IBAction func pageValueChanged(_ sender: Any) {
        showItem(at: pageControl.currentPage)
    }
}

// MARK: - Private Functions
extension OnBoardingViewController{
    private func skipShow(_ bool: Bool)
    {
        skipButton.isHidden = !bool
        signUpButton.isHidden = bool
        loginButton.isHidden = bool
    }
    
    private func showItem(at index: Int)
    {
        skipShow(index != 2)
        pageControl.page = index
        let indexPath = IndexPath(item: index, section: 0)
        BoardingCollectionView.scrollToItem(at: indexPath, at: [.centeredHorizontally,.centeredVertically], animated: true)
    }
}

// MARK: - UIViewController Delegation and DataSourcce
extension OnBoardingViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: BoardingCollectionView.frame.width, height: BoardingCollectionView.frame.height)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        let page = Int(floor(scrollView.contentOffset.x - pageWidth / 2) / pageWidth + 1)
        pageControl.page = page
        skipShow(page != 2)
    }
}

// MARK: - UIPageControl
extension UIPageControl {
    var page:Int{
        get {
            return currentPage
        }
        set {
            currentPage = newValue
            setIndicatorImage(ImageHelper.pageSelected, forPage: newValue)
            
            for index in 0..<numberOfPages where index != newValue {
                preferredIndicatorImage = ImageHelper.page
            }
        }
    }
}
