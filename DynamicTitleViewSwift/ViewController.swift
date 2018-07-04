//
//  ViewController.swift
//  DynamicTitleViewSwift
//
//  Created by Moon on 2018/7/1.
//  Copyright © 2018年 Moon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNameArea: UIView!
    @IBOutlet weak var lastNameArea: UIView!
    @IBOutlet weak var contactArea: UIView!
    @IBOutlet weak var relationshipArea: UIView!
    @IBOutlet weak var memoArea: UIView!
    @IBOutlet weak var addressArea: UIView!
    
    let firstNameView = DynamicView()
    let lastNameView = DynamicView()
    let contactView = DynamicView()
    let relationshipView = DynamicView()
    let memoView = DynamicView()
    let addressView = DynamicView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameView.titleLabel.text = "First name"
        firstNameView.delegate = self
        view.addSubview(firstNameView)
        
        lastNameView.titleLabel.text = "Last name"
        lastNameView.delegate = self
        view.addSubview(lastNameView)
        
        contactView.titleLabel.text = "Contact"
        contactView.delegate = self
        view.addSubview(contactView)
        
        relationshipView.titleLabel.text = "Relationship"
        relationshipView.delegate = self
        view.addSubview(relationshipView)
        
        memoView.titleLabel.text = "Memo"
        memoView.delegate = self
        view.addSubview(memoView)
        
        addressView.titleLabel.text = "Address"
        addressView.delegate = self
        view.addSubview(addressView)
        
    }

    override func viewDidLayoutSubviews() {
        firstNameView.frame = firstNameArea.frame
        lastNameView.frame = lastNameArea.frame
        contactView.frame = contactArea.frame
        relationshipView.frame = relationshipArea.frame
        memoView.frame = memoArea.frame
        addressView.frame = addressArea.frame
    }

    @IBAction func viewDidTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
}

extension ViewController: DynamicViewDelegate {
    func dynamicDidBeginEditing() {
        print("Function: \(#function), line:\(#line)")
    }
    
    func dynamicDidEndEditing() {
        print("Function: \(#function), line:\(#line)")
    }
    
}

