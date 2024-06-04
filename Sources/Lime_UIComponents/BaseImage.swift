//
//  BaseLogoImage.swift
//  jaram_iOS
//
//  Created by Limefriends on 3/4/24.
//

import UIKit

public class BaseImage: UIImageView {
    public init(logoName: String, width: Int, height: Int) {
        super.init(frame: .zero)
        self.contentMode = .scaleAspectFit
        self.image = UIImage(named: logoName)
        self.frame = CGRect(x: 0, y: 0, width: width, height: height)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
