//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func printRockPaperScissor() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
}

func playRockPaperScissor() {
    guard let userHand = readLine() else {
        return
    }
}
