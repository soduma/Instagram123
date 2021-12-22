//
//  FeedTableViewCell.swift
//  Instagram
//
//  Created by 장기화 on 2021/12/21.
//

import UIKit
import SnapKit

class FeedTableViewCell: UITableViewCell {
    private lazy var feedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .yellow
        return imageView
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        return button
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "message"), for: .normal)
        return button
    }()
    
    private lazy var directButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "paperplane"), for: .normal)
        return button
    }()
    
    private lazy var bookmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bookmark"), for: .normal)
        return button
    }()
    
    private lazy var currentLikeCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.numberOfLines = 5
        label.text = "멍멍이 외 5명이 좋아합니다."
        return label
    }()
    
    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.numberOfLines = 5
        label.text = """
        달이 익어가니 서둘러 젊은 피야
        민들레 한 송이 들고
        사랑이 어지러이 떠다니는 밤이야
        날아가 사뿐히 이루렴
        팽팽한 어둠 사이로
        떠오르는 기분
        이 거대한 무중력에 혹 휘청해도
        두렵진 않을 거야
        푸르른 우리 위로
        커다란 strawberry moon 한 스쿱
        나에게 너를 맡겨볼래 eh-oh
        바람을 세로질러
        날아오르는 기분 so cool
        삶이 어떻게 더 완벽해 ooh
        """
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 11, weight: .medium)
        label.numberOfLines = 5
        label.text = "1일 전"
        return label
    }()
    
    func setUp() {
        [feedImageView, likeButton, directButton, commentButton, bookmarkButton, currentLikeCountLabel, contentLabel, dateLabel].forEach { addSubview($0) }
        
        feedImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(feedImageView.snp.width)
        }
        
        likeButton.snp.makeConstraints {
            $0.top.equalTo(feedImageView.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(16)
            $0.width.height.equalTo(24)
        }
        
        directButton.snp.makeConstraints {
            $0.top.equalTo(likeButton.snp.top)
            $0.leading.equalTo(likeButton.snp.trailing).offset(12)
            $0.width.height.equalTo(24)
        }
        
        commentButton.snp.makeConstraints {
            $0.top.equalTo(likeButton.snp.top)
            $0.leading.equalTo(directButton.snp.trailing).offset(12)
            $0.width.height.equalTo(24)
        }
        
        bookmarkButton.snp.makeConstraints {
            $0.top.equalTo(likeButton.snp.top)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.height.equalTo(24)
        }
        
        currentLikeCountLabel.snp.makeConstraints {
            $0.top.equalTo(likeButton.snp.bottom).offset(14)
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(currentLikeCountLabel.snp.bottom).offset(8)
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(8)
            $0.bottom.equalToSuperview().inset(16)
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
        }
    }
}


