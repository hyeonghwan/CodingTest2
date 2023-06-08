//
//  First.swift
//  coding
//
//  Created by 박형환 on 2023/06/02.
//

import Foundation

// # 1
func sayHello(_ arr: String...){
    arr.enumerated().forEach{ index,name in
        if (index + 1) % 2 == 0 {
            print("Hi \(name), you are \(index + 1)st.")
        }else{
            print("Hello \(name), you are \(index + 1)st.")
        }
    }
}

//sayHello("아이언맨","토르","헐크","캡틴","블랙위도우","호크아이","타노스","앤트맨","닥터스트레인지","비전")

