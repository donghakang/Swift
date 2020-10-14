//
//  SideMenuView.swift
//  DrawerLayout
//
//  Created by Dongha Kang on 2020/10/14.
//

import UIKit

class SideMenuView: UIView {
/*
     @param {String} identifier - UIView's identifier
     @param {int} screenW - width of the screen
     @param {int} screenH - height of the screen
     @param {UIView} darView - subView between Menu View and Main View
     */
    static let identifier = "SideMenu"
    let screenW = UIScreen.main.bounds.width * 3 / 4
    let screenH = UIScreen.main.bounds.height

    let darkView = UIView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = CGRect(x: -screenW , y: 0 , width: screenW, height: screenH)
        self.backgroundColor = .red
        addGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // initializing
    func addMenuTo(sender: UIViewController) {
        /*
         @param {UIViewController} sender - the main view controller where it has the menu view
         */
        darkView.frame = sender.view.frame
        darkView.backgroundColor = .black
        darkView.alpha = 0.0
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapHandler(sender:)))
        darkView.addGestureRecognizer(tapGesture)

        sender.view.addSubview(darkView)
    }
    
    
    // MARK: - appear and Disappear
    func appear(sender: UIViewController){

        // slide sidemenu
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
            self.darkView.alpha = 0.5
            self.frame = CGRect(x: 0 , y: 0 , width: self.screenW, height: self.screenH)
        }, completion: nil)
    }
    
    func disappear() {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
            self.darkView.alpha = 0.0
            self.frame = CGRect(x: -self.screenW , y: 0 , width: self.screenW, height: self.screenH)
        }, completion: nil)
    }
    
}


// MARK: - Gesture Recognizer
extension SideMenuView {
    func addGesture() {
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandler(sender:)))
        swipeGesture.direction = .left
        self.addGestureRecognizer(swipeGesture)
    }
        
    @objc func swipeHandler(sender: UISwipeGestureRecognizer) {
        self.disappear()
    }
    
    @objc func tapHandler(sender: UITapGestureRecognizer) {
        self.disappear()
    }
}
