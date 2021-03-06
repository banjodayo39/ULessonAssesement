//
//  ChapterCollectionViewCell.swift
//  ULessonAssesement
//
//  Created by Dayo Banjo on 3/24/21.
//

import UIKit

class ChapterCollectionViewCell: UICollectionViewCell {
    static let id = "\(ChapterCollectionViewCell.self)"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let cellTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "Mulish-Regular", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    func configureCell(with lesson: Lesson) {
        contentView.backgroundColor = .white
        cellTitle.text = lesson.name
        
        
        DispatchQueue.global(qos: .background).async {
            guard let url = URL(string: lesson.icon ?? "") else {return}
            guard let data = try? Data(contentsOf: url) else {return}
            DispatchQueue.main.async {
                self.cellImageView.image = UIImage(data: data)
            }
        }
    }
    
    
    private func setupView(){
        self.contentView.layer.cornerRadius = 13
        self.contentView.addSubview(cellImageView)
        self.contentView.addSubview(cellTitle)
        
        cellImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        cellImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        cellTitle.topAnchor.constraint(equalTo: self.cellImageView.bottomAnchor, constant: 20).isActive = true
        cellTitle.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 20).isActive = true
        cellTitle.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -20).isActive = true
        cellTitle.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20).isActive = true
    }
    
}
