//  RockPaperScissors - RockPaperScissorsGame.swift
//  Created by vetto, songjun on 2022.12.27

func makeRandomComputerHand() -> Int {
    return Int.random(in: 1...3)
}

func inputUserHand() -> Int {
    guard let userInput = readLine() else {
        return inputUserHand()
    }
    guard let userHand = Int(userInput) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return inputUserHand()
    }
    return userHand
}

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
}

func compareHand(computerHand: Int, userHand: Int) -> String {
    let result: String
    
  // 변경
    if userHand - computerHand == 0 {
        result = "비겼습니다!"
    } else if userHand - computerHand == -2 || userHand - computerHand == 1 {
        result = "이겼습니다!"
    } else {
        result = "졌습니다!"
    }
    
    return result
}


func startGame() {
    while true {
        let userInput = inputUserHand()
        switch userInput {
        case 0:
            print("게임 종료")
            return
        case 1,2,3:
            print(compareHand(computerHand: makeRandomComputerHand(), userHand: userInput))
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
}
