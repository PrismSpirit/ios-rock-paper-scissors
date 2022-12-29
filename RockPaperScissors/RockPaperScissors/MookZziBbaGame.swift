//  RockPaperScissors - MookZziBba.swift
//  Created by vetto, songjun on 2022.12.28

func printTurnAndMenu(presentTurn: Winner) {
    print("[\(presentTurn.name)턴] 묵(1), 찌(2), 빠(3)! <종료: 0> :", terminator: " ")
}

func convertNumberToMookZziBba(number: Int) -> MookZziBba {
    guard let hand = MookZziBba(rawValue: number) else {
        return MookZziBba.wrongHand
    }
    return hand
}

func decideMookZziBbaWinner(_ userHand: MookZziBba,_ computerHand: MookZziBba) -> Winner {
    switch (userHand, computerHand) {
    case (.zzi, .bba), (.mook, .zzi), (.bba, .mook):
        return .user
    case (.zzi, .mook), (.mook, .bba), (.bba, .zzi):
        return .computer
    default:
        return .draw
    }
}

func printMookZziBbaGameResult(result: Winner, turn: Winner) {
    switch result {
    case .computer:
        print("\(result.name)의 턴입니다.")
        startMookZziBbaGame(turn: .computer)
    case .user:
        print("\(result.name)의 턴입니다.")
        startMookZziBbaGame(turn: .user)
    default:
        print("\(turn.name)의 승리!")
    }
}

func startMookZziBbaGame(turn: Winner) {
    do {
        printTurnAndMenu(presentTurn: turn)
        
        let inputtedNumber = try inputUserNumber()
        
        switch inputtedNumber {
        case 0:
            print("게임종료")
        case 1, 2, 3:
            let userHand = convertNumberToMookZziBba(number: inputtedNumber)
            let computerHand = convertNumberToMookZziBba(number: makeRandomComputerNumber())
            let result = decideMookZziBbaWinner(userHand, computerHand)
            
            printMookZziBbaGameResult(result: result, turn: turn)
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            startMookZziBbaGame(turn: .computer)
        }
    } catch InputError.invalidInput {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startMookZziBbaGame(turn: .computer)
    } catch {
        print(error)
    }
}
