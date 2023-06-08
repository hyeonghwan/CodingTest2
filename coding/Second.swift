//
//  Second.swift
//  coding
//
//  Created by 박형환 on 2023/06/02.
//

import Foundation

// # 2
class Player{
    var name: String
    
    init(name: String){
        self.name = name
    }
    func displayname() -> String{
        return name
    }
}

struct Friend{
    var name: String
    func displayname() -> String{
        return name
    }
}
//
//let playerOne: Player = Player(name: "호날두")
//let playerTwo: Player = playerOne
//playerOne.name = "메시"
//print("P1: \(playerOne.displayname())") // P1: 메시 선수
//print("P2: \(playerTwo.displayname())") // P2: 메시 선수
//
//var friendOne: Friend = Friend(name: "둘리")
//var friendTwo: Friend = friendOne
//friendOne.name = "도우너"
//print("F1: \(friendOne.displayname())") // F1: 도우너 선수
//print("F2: \(friendTwo.displayname())") // F2: 둘리 선수
