//
//  File.swift
//  
//
//  Created by Limefriends on 6/4/24.
//

import UIKit

public extension String {
    
    /// 날짜 형식
    enum DateFormatType {
        case yearMonthDay // 월 년 일
        case yearMonthDayHourMinute // 월 년 일 시 분
        case hourMinute // 시 분
    }
    
    
    /// "2024-06-19 24:00:00" 형식으로 Response 값 지정
    /// - Parameter format: 날짜 형식
    public func releaseDateFormat(format: DateformatType) -> String {
        let componentArray = self.components(separatedBy: " ")
        let timeSeparator = componentArray[1].components(separatedBy: ":")
        guard componentArray.count > 1 else {
            if format == .yearMonthDay {
                return componentArray[0]
            } else {
                return ""
            }
        }
        let date = componentArray[0] // 년 월 일
        
        guard timeSeparator.count >= 2 else { return "" }
        let hourMinute = timeSeparator[0] + ":" + timeSeparator[1] // 시 분
        
        switch format {
        case .yearMonthDay:
            return date
        case .yearMonthDayHourMinute:
            return date + " " + hourMinute
        case .hourMinute:
            return hourMinute
        }
        
    }
    
    
}
