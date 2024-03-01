//
//  GameViewController.swift
//  Motion ball
//
//  Created by  aleksandr on 17.12.22.
//

import UIKit
import CoreMotion
import Lottie

class GameViewController: UIViewController {
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    
    
    var image = UIImage(named: "food1")
    private lazy var imageView = UIImageView(image: image)
    private lazy var imageViewSecond = UIImageView(image: image)
    private lazy var imageViewThird = UIImageView(image: image)
    
    
    var isGaming = true
    
    @IBOutlet weak var grassView: UIView!
    
    
    @IBOutlet weak var birdViewFirst: UIView!
    @IBOutlet weak var birdThierdView: UIView!
    @IBOutlet weak var birdSecondView: UIView!
    @IBOutlet weak var birdFourView: UIView!
    
    
    
    @IBOutlet weak var TreeViewFirst: UIView!
    @IBOutlet weak var treeView: UIView!
    @IBOutlet weak var fluViewFood: UIView!
    @IBOutlet weak var fluViewFoodFirst: UIView!
    @IBOutlet weak var fluViewFoodSecond: UIView!
    
    @IBOutlet weak var animeView: UIView!
    @IBOutlet weak var fonAnimeView: UIView!
    
    let myView = UIView()
    let motionManager = CMMotionManager()
    var timer: Timer!
    var absoluteVal = 0.0

    var lastX = 0.0
    var lastY = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.addSubview(birdViewFirst)
        birdViewFirst.frame = CGRect(x: 900, y: 100, width: 70, height: 70)
        view.addSubview(birdSecondView)
        birdSecondView.frame = CGRect(x: 900, y: 50, width: 70, height: 70)
        view.addSubview(birdThierdView)
        birdThierdView.frame = CGRect(x: 900, y: 200, width: 70, height: 70)
        view.addSubview(birdFourView)
        birdFourView.frame = CGRect(x: 900, y: 300, width: 70, height: 70)

        
        
        view.addSubview(fluViewFood)
        fluViewFood.frame = CGRect(x: 900, y: 150, width: 100, height: 100)
        view.addSubview(fluViewFoodFirst)
        fluViewFoodFirst.frame = CGRect(x: 900, y: 30, width: 70, height: 70)
        view.addSubview(fluViewFoodSecond)
        fluViewFoodSecond.frame = CGRect(x: 900, y: 300, width: 70, height: 70)
        
        
        view.addSubview(grassView)
        grassView.frame = CGRect(x: -550, y: 5, width: 1950, height: 450)
        
        view.addSubview(treeView)
        treeView.frame = CGRect(x: 900, y: 120, width: 350, height: 350)
        view.addSubview(TreeViewFirst)
        TreeViewFirst.frame = CGRect(x: 900, y: 50, width: 450, height: 450)
        
        
        
        
        
//        view.addSubview(imageView)
//        imageView.frame = CGRect(x: 900, y: 50, width: 40, height: 40)
//        view.addSubview(imageViewSecond)
//        imageViewSecond.frame = CGRect(x: 900, y: 150, width: 40, height: 40)
//        view.addSubview(imageViewThird)
//        imageViewThird.frame = CGRect(x: 900, y: 300, width: 40, height: 40)
        

        motionManager.startAccelerometerUpdates()
        motionManager.startGyroUpdates()
        motionManager.startMagnetometerUpdates()
        motionManager.startDeviceMotionUpdates()
        
        timer = Timer.scheduledTimer(timeInterval: 0.0083333333, target: self, selector: #selector(GameViewController.update), userInfo: nil, repeats: true)
        //fonAnimationView()
        
    
    }

    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
        
        let animeteTrView = AnimationView(name: "tr")
        animeteTrView.contentMode = .scaleToFill
        animeteTrView.frame = self.grassView.bounds
        animeteTrView.animationSpeed = 0.3
        animeteTrView.loopMode = .loop
        animeteTrView.play()
        self.grassView.addSubview(animeteTrView)
        
        
        
        
        
        let animeteBirdViewFirst = AnimationView(name: "bird1")
        animeteBirdViewFirst.contentMode = .scaleAspectFill
        animeteBirdViewFirst.frame = self.birdViewFirst.bounds
        animeteBirdViewFirst.loopMode = .loop
        animeteBirdViewFirst.play()
        self.birdViewFirst.addSubview(animeteBirdViewFirst)
        
        let animeteBirdSecondView = AnimationView(name: "bird2")
        animeteBirdSecondView.contentMode = .scaleAspectFill
        animeteBirdSecondView.frame = self.birdSecondView.bounds
        animeteBirdSecondView.loopMode = .loop
        animeteBirdSecondView.play()
        self.birdSecondView.addSubview(animeteBirdSecondView)
        
        let animeteBirdThidrView = AnimationView(name: "bird3")
        animeteBirdThidrView.contentMode = .scaleAspectFill
        animeteBirdThidrView.frame = self.birdThierdView.bounds
        animeteBirdThidrView.loopMode = .loop
        animeteBirdThidrView.play()
        self.birdThierdView.addSubview(animeteBirdThidrView)
        
        let animeteBirdFourView = AnimationView(name: "bird2")
        animeteBirdFourView.contentMode = .scaleAspectFill
        animeteBirdFourView.frame = self.birdFourView.bounds
        animeteBirdFourView.loopMode = .loop
        animeteBirdFourView.play()
        self.birdFourView.addSubview(animeteBirdFourView)


   
        
        let animeteFlyFoodView = AnimationView(name: "money1")
        animeteFlyFoodView.contentMode = .scaleAspectFit
        animeteFlyFoodView.frame = self.fluViewFood.bounds
        animeteFlyFoodView.loopMode = .loop
        animeteFlyFoodView.play()
        self.fluViewFood.addSubview(animeteFlyFoodView)
          
        let animeteFlyFoodFirstView = AnimationView(name: "money2")
        animeteFlyFoodFirstView.contentMode = .scaleAspectFit
        animeteFlyFoodFirstView.frame = self.fluViewFoodFirst.bounds
        animeteFlyFoodFirstView.loopMode = .loop
        animeteFlyFoodFirstView.play()
        self.fluViewFoodFirst.addSubview(animeteFlyFoodFirstView)

        let animeteFlyFoodSecondView = AnimationView(name: "money2")
        animeteFlyFoodSecondView.contentMode = .scaleAspectFit
        animeteFlyFoodSecondView.frame = self.fluViewFoodSecond.bounds
        animeteFlyFoodSecondView.loopMode = .loop
        animeteFlyFoodSecondView.play()
        self.fluViewFoodSecond.addSubview(animeteFlyFoodSecondView)
        
        
        
        let animeteTreeView = AnimationView(name: "Tree")
        animeteTreeView.contentMode = .scaleAspectFit
        animeteTreeView.frame = self.treeView.bounds
        animeteTreeView.loopMode = .loop
        animeteTreeView.animationSpeed = 0.3
        animeteTreeView.play()
        self.treeView.addSubview(animeteTreeView)
        
        let animeteTreeViewFirst = AnimationView(name: "Tree")
        animeteTreeViewFirst.contentMode = .scaleAspectFit
        animeteTreeViewFirst.frame = self.TreeViewFirst.bounds
        animeteTreeViewFirst.loopMode = .loop
        animeteTreeViewFirst.animationSpeed = 0.3
        animeteTreeViewFirst.play()
        self.TreeViewFirst.addSubview(animeteTreeViewFirst)
        
        
        
       
        let animeteSkyView = AnimationView(name: "sky")
        animeteSkyView.contentMode = .scaleAspectFill
        animeteSkyView.frame = self.fonAnimeView.bounds
        animeteSkyView.loopMode = .loop
        animeteSkyView.play()
        self.fonAnimeView.addSubview(animeteSkyView)
        
        //grassView.backgroundColor = UIColor(named: "green")
        
        let animetionBirdView = AnimationView(name: "birdAnimation")
        animetionBirdView.contentMode = .scaleAspectFill
        animetionBirdView.frame = self.animeView.bounds
        animetionBirdView.loopMode = .loop
        animetionBirdView.play()
        self.animeView.addSubview(animetionBirdView)
        
        
        UIView.animate(withDuration: 6, delay: 16, options: [
            .curveLinear, .repeat], animations: {
                self.birdViewFirst.frame.origin.x +=
                self.view.frame.height - 2000
            })
        
        UIView.animate(withDuration: 8, delay: 11, options: [
            .curveLinear, .repeat], animations: {
                self.birdSecondView.frame.origin.x +=
                self.view.frame.height - 1800
            })
        
        UIView.animate(withDuration: 9, delay: 10, options: [
            .curveLinear, .repeat], animations: {
                self.birdThierdView.frame.origin.x +=
                self.view.frame.height - 2000
            })
        
        UIView.animate(withDuration: 13, delay: 3, options: [
            .curveLinear, .repeat], animations: {
                self.birdFourView.frame.origin.x +=
                self.view.frame.height - 2000
            })
        
        
        
        
        
        UIView.animate(withDuration: 13, delay: 5, options: [
            .curveLinear, .repeat], animations: {
                self.fluViewFood.frame.origin.x +=
                self.view.frame.height - 2000
            })
        UIView.animate(withDuration:9, delay: 21, options: [
            .curveLinear, .repeat], animations: {
                self.fluViewFoodFirst.frame.origin.x +=
                self.view.frame.height - 2000
            })
        UIView.animate(withDuration: 16, delay: 12, options: [
            .curveLinear, .repeat], animations: {
                self.fluViewFoodSecond.frame.origin.x +=
                self.view.frame.height - 2000
            })
        
        
        
        UIView.animate(withDuration: 18, delay: 5, options: [
            .curveLinear, .repeat], animations: {
                self.treeView.frame.origin.x +=
                self.view.frame.height - 2000
            })
        UIView.animate(withDuration: 18, delay: 15, options: [
            .curveLinear, .repeat], animations: {
                self.TreeViewFirst.frame.origin.x +=
                self.view.frame.height - 2000
            })
        
        
//        UIView.animate(withDuration: 6, delay: 10, options: [
//            .curveLinear, .repeat], animations: {
//                self.imageView.frame.origin.x +=
//                self.view.frame.height - 1900
//            })
//        
//        UIView.animate(withDuration: 3, delay: 15, options: [
//            .curveLinear, .repeat], animations: {
//                self.imageViewSecond.frame.origin.x +=
//                self.view.frame.height - 1600
//            })
//        
//        UIView.animate(withDuration: 8, delay: 32, options: [
//            .curveLinear, .repeat], animations: {
//                self.imageViewThird.frame.origin.x +=
//                self.view.frame.height - 1900
//            })
        intersectsFoodFly()
        intersectsFirstFoodFly()
//        intersectsSecondFoodFly()
//        intersectsThirdFoodFly()
//        intersectsFourFoodFly()
        intersectsZeroFoodFly()
    }
    
    
    func intersectsFoodFly() {
        guard isGaming else { return }
        if checkIntersect(animeView, fluViewFood){
            print("food111")
            isGaming = true
            fluViewFood.frame = CGRect(x: 900, y: 150, width: 20, height: 20)
            UIView.animate(withDuration: 13, delay: 5, options: [
                .curveLinear, .repeat], animations: {
                    self.fluViewFood.frame.origin.x +=
                    self.view.frame.height - 2000

                })
            let animeteFlyFoodViewBom = AnimationView(name: "bum")
            animeteFlyFoodViewBom.contentMode = .scaleAspectFit
            animeteFlyFoodViewBom.frame = CGRect(x: 0, y: -60, width: 150, height: 150)
            //animeteFlyFoodViewBom.frame = self.animeView.bounds
            animeteFlyFoodViewBom.animationSpeed = 2
            animeteFlyFoodViewBom.play()
            self.animeView.addSubview(animeteFlyFoodViewBom)
            print("bom")
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.intersectsFoodFly()
            
        }
        
    }
    
    func intersectsZeroFoodFly() {
        guard isGaming else { return }
        if checkIntersect(animeView, fluViewFoodSecond){
            print("food222")
            isGaming = true
            fluViewFoodSecond.frame = CGRect(x: 900, y: 300, width: 20, height: 20)
            UIView.animate(withDuration: 28, delay: 12, options: [
                .curveLinear, .repeat], animations: {
                    self.fluViewFoodSecond.frame.origin.x +=
                    self.view.frame.height - 2000
                })
            let animeteFlyFoodViewBom = AnimationView(name: "bum")
            animeteFlyFoodViewBom.contentMode = .scaleAspectFit
            animeteFlyFoodViewBom.frame = CGRect(x: 0, y: -60, width: 150, height: 150)
            //animeteFlyFoodViewBom.frame = self.animeView.bounds
            animeteFlyFoodViewBom.animationSpeed = 2
            animeteFlyFoodViewBom.play()
            self.animeView.addSubview(animeteFlyFoodViewBom)
            print("bom")
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.intersectsZeroFoodFly()
        }
    }
    
    
    
    func intersectsFirstFoodFly() {
        guard isGaming else { return }
        if checkIntersect(animeView, fluViewFoodFirst){
            print("food333")
            isGaming = true
            fluViewFoodFirst.frame = CGRect(x: 900, y: 30, width: 20, height: 20)
            UIView.animate(withDuration: 20, delay: 21, options: [
                .curveLinear, .repeat], animations: {
                    self.fluViewFoodFirst.frame.origin.x +=
                    self.view.frame.height - 2000
                })
            let animeteFlyFoodViewBom = AnimationView(name: "bum")
            animeteFlyFoodViewBom.contentMode = .scaleAspectFit
            animeteFlyFoodViewBom.frame = CGRect(x: 0, y: -60, width: 150, height: 150)
            //animeteFlyFoodViewBom.frame = self.animeView.bounds
            animeteFlyFoodViewBom.animationSpeed = 2
            animeteFlyFoodViewBom.play()
            self.animeView.addSubview(animeteFlyFoodViewBom)
            print("bom")
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.intersectsFirstFoodFly()
        }
    }
    
    
    
    
//    func intersectsSecondFoodFly() {
//        guard isGaming else { return }
//        if checkIntersect(animeView, imageView){
//            print("food1")
//            isGaming = true
//            imageView.frame = CGRect(x: 900, y: 50, width: 40, height: 40)
//            UIView.animate(withDuration: 6, delay: 4, options: [
//                .curveLinear, .repeat], animations: {
//                    self.imageView.frame.origin.x +=
//                    self.view.frame.height - 1400
//                })
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//            self.intersectsSecondFoodFly()
//        }
//    }
//    
//    func intersectsThirdFoodFly() {
//        guard isGaming else { return }
//        if checkIntersect(animeView, imageViewSecond){
//            print("food2")
//            isGaming = true
//            imageViewSecond.frame = CGRect(x: 900, y: 150, width: 40, height: 40)
//            UIView.animate(withDuration: 3, delay: 5, options: [
//                .curveLinear, .repeat], animations: {
//                    self.imageViewSecond.frame.origin.x +=
//                    self.view.frame.height - 1500
//                })
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//            self.intersectsThirdFoodFly()
//        }
//    }
//    
//    func intersectsFourFoodFly() {
//        guard isGaming else { return }
//        if checkIntersect(animeView, imageViewThird){
//            print("food3")
//            isGaming = true
//            imageViewThird.frame = CGRect(x: 900, y: 300, width: 40, height: 40)
//            UIView.animate(withDuration: 2, delay: 2, options: [
//                .curveLinear, .repeat], animations: {
//                    self.imageViewThird.frame.origin.x +=
//                    self.view.frame.width - 1900
//                })
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//            self.intersectsFourFoodFly()
//        }
//    }
    
   
    
    
    
    func checkIntersect(_ first: UIView, _ second: UIView) -> Bool {
        guard let firstFrame = first.layer.presentation()?.frame,
              let secondFrame = second.layer.presentation()?.frame else { return true }
        return firstFrame.intersects(secondFrame)
    }
    
    
    
    
    
    @objc func update() {
        if let accelerometerData = motionManager.accelerometerData {

            let valX = accelerometerData.acceleration.x
            let valY = accelerometerData.acceleration.y
            
            var newX = animeView.frame.origin.x - CGFloat(valY * 15)
            newX = max(newX, -30)
            newX = min(newX, view.frame.size.width - 100)
            
            var newY = animeView.frame.origin.y - CGFloat(valX * 15)
            newY = max(newY, -20)
            newY = min(newY, view.frame.size.height - 100)
            
            self.animeView.frame.origin.x = newX
            self.animeView.frame.origin.y = newY
        }
    }
  
}
