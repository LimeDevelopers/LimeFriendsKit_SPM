//
//  CustomDropDownButton.swift
//  boilerplate
//
//  Created by Limefriends on 5/3/24.
//

import UIKit

/// 왼쪽에 title, 오른쪽에 image 설정
public class CustomDropDownButton: UIButton {
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let imageView = imageView, let titleLabel = titleLabel else {
            return
        }
        
        // 텍스트를 버튼의 왼쪽에 배치하고 이미지를 오른쪽 끝에 배치
        titleLabel.frame = CGRect(x: self.bounds.origin.x + 10,
                                  y: self.bounds.origin.y,
                                  width: titleLabel.intrinsicContentSize.width,
                                  height: self.bounds.height)
        
        imageView.frame = CGRect(x: self.bounds.width - imageView.intrinsicContentSize.width - 10,
                                 y: (self.bounds.height - imageView.intrinsicContentSize.height) / 2,
                                 width: imageView.intrinsicContentSize.width,
                                 height: imageView.intrinsicContentSize.height)
        
        // 버튼의 기본 titleEdgeInsets와 imageEdgeInsets 속성 사용
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -10)
    }
}
