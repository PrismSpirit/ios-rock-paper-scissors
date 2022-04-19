//
//  gameMessage.swift
//  RockPaperScissors
//
//  Created by 이예은 on 2022/04/18.
//

import Foundation

enum GameMessage: String {
    case menu = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    case winning = "이겼습니다!"
    case defeat = "졌습니다!"
    case draw = "비겼습니다!"
    case ending = "게임 종료"
    case error = "잘못된 입력입니다. 다시 시도해주세요."
}
