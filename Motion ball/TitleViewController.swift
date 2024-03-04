//
//  TitleViewController.swift
//  Motion ball
//
//  Created by  aleksandr on 18.12.22.
//

import UIKit
import Lottie
import RiveRuntime

class TitleViewController: UIViewController {
    
    var simpleVM = RiveViewModel(fileName: "pigeons_button")
    
    @IBOutlet weak var playView: UIView!
    
    
    @IBOutlet weak var fonTitleAnimate: AnimationView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let animeteFonView = AnimationView(name: "fonTit")
        animeteFonView.frame = CGRect(x: 0, y: 0, width: 600, height: 600)
        animeteFonView.center = self.fonTitleAnimate.center
        animeteFonView.contentMode = .scaleAspectFill
        animeteFonView.play()
        animeteFonView.contentMode = .scaleAspectFill
        animeteFonView.frame = self.fonTitleAnimate.bounds
        //animeteFonView.loopMode = .loop
        fonTitleAnimate.addSubview(animeteFonView)
        
    
//        let animetePlayView = AnimationView(name: "play")
//        animetePlayView.contentMode = .scaleAspectFit
//        animetePlayView.frame = self.playView.bounds
//        animetePlayView.loopMode = .loop
//        animetePlayView.play()
//        self.playView.addSubview(animetePlayView)
//        animetePlayView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(playGame)))
        
        
        let riveView = simpleVM.createRiveView()
        view.addSubview(riveView)
    riveView.frame = view.bounds
    riveView.frame = CGRect(x: 410, y: -100, width: 500, height: 500)
    view.addSubview(riveView)
        riveView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(playGame)))
        
    
    //Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(loading), userInfo: nil, repeats: false)
}

@objc func loading() {
    let storuboard = UIStoryboard(name: "Main", bundle: nil)
    let vc = storuboard.instantiateViewController(withIdentifier: "GameViewController")
    vc.modalTransitionStyle = .crossDissolve
    self.present(vc, animated: true)
    simpleVM.stop()
}
   
   
    @objc func playGame() {
        Timer.scheduledTimer(timeInterval: 2.1, target: self, selector: #selector(loading), userInfo: nil, repeats: false)
//        let storuboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storuboard.instantiateViewController(withIdentifier: "GameViewController")
//        vc.modalTransitionStyle = .crossDissolve
//        self.present(vc, animated: true)

    }
    
   
}
