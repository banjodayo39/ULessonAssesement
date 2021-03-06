//
//  GenericViewController.swift
//  ULessonAssesement
//
//  Created by Dayo Banjo on 3/24/21.
//

import UIKit

class GenericViewController<content: UIView>: UIViewController {
    var contentView: content
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        contentView = content()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupCustomView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCustomView(){
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
    }
}

