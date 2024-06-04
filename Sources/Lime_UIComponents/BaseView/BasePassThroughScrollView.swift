//
//  BasePassThroughScrollView.swift
//  boilerplate
//
//  Created by Limefriends on 5/3/24.
//

import UIKit

/// 스크롤 뷰 위에 있는 컨텐츠가 터치 이벤트를 처리 할 수 있도록
/// BaseViewControler에 touchesBegan 설정이 되어 있다면 빈 화면을 눌렀을때 키보드 내려감
open class BasePassThroughScrollView: UIScrollView {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        next?.touchesBegan(touches, with: event)
    }
}

/*
 /// ScrollView가 적용되어 있을때 빈 화면 클릭시 키보드 내리기
 fileprivate func clickOnTheBlankToDownKeyBoard() {
     let singleTapGestureRecongnizer = UITapGestureRecognizer(target: self, action: #selector(MyTapMethod))
     singleTapGestureRecongnizer.numberOfTapsRequired = 1
     singleTapGestureRecongnizer.isEnabled = true
     singleTapGestureRecongnizer.cancelsTouchesInView = false
     scrollView.addGestureRecognizer(singleTapGestureRecongnizer)
 }
 
 @objc func MyTapMethod() {
     self.view.endEditing(true)
 }
 */
