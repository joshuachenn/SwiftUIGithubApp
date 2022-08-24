//
//  StringEx.swift
//  SwiftUIGithubApp
//
//  Created by Joshua on 2022/7/25.
//

extension String {
    // 截取字符串：从index到结束处
    // - Parameter index: 开始索引
    // - Returns: 子字符串
    func subStringFrom(_ index: Int) -> String {
        let theIndex = self.index(self.endIndex, offsetBy: index - self.count)
        return String(self[theIndex..<endIndex])
    }
    
    func subString(in range: Range<Int>) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: range.lowerBound)
        let endIndex = self.index(self.startIndex, offsetBy: range.upperBound)
        return String(self[startIndex..<endIndex])
    }
    
    // 从0索引处开始查找开始查找是否包含制定的字符串，返回Int类型索引
    // 返回第一次出现的指定子字符串在此字符串中的索引
    func findFirst(_ sub: String) -> Int {
        var pos = -1
        if let range = range(of: sub, options: .literal) {
            if !range.isEmpty {
                pos = self.distance(from: startIndex, to: range.lowerBound)
            }
        }
        return pos
    }
    
    // 从0索引处开始查找开始查找是否包含制定的字符串，返回Int类型索引
    // 返回最后出现的指定子字符串在此字符串中的索引
    func findLast(_ sub: String) -> Int {
        var pos = -1
        if let range = range(of: sub, options: .backwards) {
            if !range.isEmpty {
                pos = self.distance(from: startIndex, to: range.lowerBound)
            }
        }
        return pos
    }
    
    // 从指定索引处开始查找开始查找是否包含制定的字符串，返回Int类型索引
    // 返回第一次出现的指定子字符串在此字符串中的索引
    func findFirst(_ sub: String, _ begin: Int) -> Int {
        let str = self.subStringFrom(begin)
        let pos = str.findFirst(str)
        return pos
    }
    
    // 从指定索引处开始查找开始查找是否包含制定的字符串，返回Int类型索引
    // 返回最后出现的指定子字符串在此字符串中的索引
    func findLast(_ sub: String, _ begin: Int) -> Int {
        let str = self.subStringFrom(begin)
        let pos = str.findLast(str)
        return pos
    }
}
