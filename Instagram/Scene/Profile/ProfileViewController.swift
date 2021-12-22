//
//  ProfileViewController.swift
//  Instagram
//
//  Created by 장기화 on 2021/12/21.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 40
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.systemGray5.cgColor
        imageView.image = UIImage(systemName: "moon.fill")
        imageView.tintColor = .systemPink
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "infofield"
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "안녕하세요. 반갑습니다😱"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var followButton: UIButton = {
        let button = UIButton()
        button.setTitle("팔로우", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 3
        return button
    }()
    
    private lazy var messageButton: UIButton = {
        let button = UIButton()
        button.setTitle("메세지", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        button.backgroundColor = .white
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.separator.cgColor
        button.layer.cornerRadius = 3
        return button
    }()
    
    private let photoDataView = ProfileDataView(title: "게시물", count: 100)
    private let followerDataView = ProfileDataView(title: "팔로워", count: 123456)
    private let followingDataView = ProfileDataView(title: "팔로잉", count: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationBar()
        setUpLayout()
    }
}

extension ProfileViewController {
    func setUpNavigationBar() {
        navigationItem.title = "infofield"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: nil)
    }
    
    func setUpLayout() {
        let buttonStackView = UIStackView(arrangedSubviews: [followButton, messageButton])
        buttonStackView.spacing = 4
        buttonStackView.distribution = .fillEqually
        
        let dataStackView = UIStackView(arrangedSubviews: [photoDataView, followerDataView, followingDataView])
        dataStackView.axis = .horizontal
        dataStackView.spacing = 4
        dataStackView.distribution = .fillEqually
        
        [profileImageView, nameLabel, descriptionLabel, buttonStackView].forEach { view.addSubview($0) }
        view.addSubview(dataStackView)
        
        let inset: CGFloat = 16
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(inset)
            $0.leading.equalToSuperview().inset(inset)
            $0.width.equalTo(80)
            $0.height.equalTo(profileImageView.snp.width)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(inset)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(inset)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(inset)
        }
        
        dataStackView.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(inset)
            $0.trailing.equalToSuperview().inset(inset)
            $0.centerY.equalTo(profileImageView.snp.centerY)
        }
    }
}
