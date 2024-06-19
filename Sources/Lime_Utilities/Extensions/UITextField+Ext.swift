//
//  File.swift
//  
//
//  Created by Limefriends on 6/19/24.
//

import UIKit

public extension TextField {
    
    
    /// 텍스틑 필드 왼쪽 padding 적용
    public func addleftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}
