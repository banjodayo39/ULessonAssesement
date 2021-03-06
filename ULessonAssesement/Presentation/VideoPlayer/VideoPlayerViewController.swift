//
//  VideoPlayerViewController.swift
//  ULessonAssesement
//
//  Created by Dayo Banjo on 3/24/21.
//

import UIKit

class VideoPlayerViewController: UIViewController {
    let lesson: Lesson
    
    init(chapterTitle: String, lesson: Lesson) {
        self.lesson = lesson
        super.init(nibName: nil, bundle: nil)
        setupView()
        self.chapterTitleLabel.text = "\t\(chapterTitle)"
        self.lessonTitleLabel.text = "\t\(lesson.name ?? "")"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        videoPlayer.timer?.invalidate()
    }
    
    private lazy var videoPlayer: VideoPlayerView = {
        let videoPlayer = VideoPlayerView()
        videoPlayer.backgroundColor = .black
        videoPlayer.heightAnchor.constraint(equalToConstant: 250).isActive = true
        videoPlayer.insertItem(url: self.lesson.media_url ?? "")
        videoPlayer.play()
        videoPlayer.translatesAutoresizingMaskIntoConstraints = false
        return videoPlayer
    }()
    
    let lessonTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Mulish-Regular", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let chapterTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "uVideoChapterTitle")
        label.font = UIFont(name: "Mulish-Regular", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let backArrow: UIImageView = {
        let imageView = UIImageView()
        imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "back_arrow_black")
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let curveLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "video_curve_logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 20
        stackView.addArrangedSubview(videoPlayer)
        stackView.addArrangedSubview(lessonTitleLabel)
        stackView.addArrangedSubview(chapterTitleLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    @objc private func didPressBackArrow(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    private func setupView(){
        backArrow.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didPressBackArrow)))
        
        self.view.backgroundColor = UIColor(named: "uBackground")
        self.view.addSubview(curveLogoImageView)
        self.view.addSubview(stackView)
        self.view.addSubview(backArrow)
        
        self.curveLogoImageView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.curveLogoImageView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.curveLogoImageView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        
        
        self.backArrow.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
        self.backArrow.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        
        stackView.topAnchor.constraint(equalTo: self.backArrow.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    }
    
}

