//
//  UploadViewController.swift
//  Instagram
//
//  Created by 장기화 on 2021/12/27.
//

import UIKit
import SnapKit

final class UploadViewController: UIViewController {
    private let uploadImage: UIImage
    private let imageView = UIImageView()
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.text = "여기에 작성"
        textView.textColor = .secondaryLabel
        textView.font = .systemFont(ofSize: 15)
        textView.delegate = self
        return textView
    }()
    
    init(uploadImage: UIImage) {
        self.uploadImage = uploadImage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setUpNavigationItem()
        setUpLayout()
        imageView.image = uploadImage
    }
}

extension UploadViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .secondaryLabel else { return }
        textView.text = nil
        textView.textColor = .label
    }
}

private extension UploadViewController {
    func setUpNavigationItem() {
        navigationItem.title = "새 게시물"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(tapLeftButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "공유", style: .done, target: self, action: #selector(tapRightButton))
    }
    
    @objc func tapLeftButton() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func tapRightButton() {
        dismiss(animated: true, completion: nil)
    }
    
    func setUpLayout() {
        [imageView, textView].forEach { view.addSubview($0) }
        
        imageView.snp.makeConstraints {
            $0.top.leading.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.width.height.equalTo(100)
        }
        
        textView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.leading.equalTo(imageView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(imageView.snp.bottom)
        }
    }
}
