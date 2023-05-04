//
//  MukJiPpaManager.swift
//  MukJiPpa
//
//  Created by redmango, 비모 on 2023/05/03.
//

class MukJiPpaManager {
    enum MukJiPpa: Int {
        case muk = 1
        case ji = 2
        case ppa = 3
    }
    
    private var currentPlayer: Player
    
    init(currentPlayer: Player) {
        self.currentPlayer = currentPlayer
    }
    
    func startGame() {
        do {
            let userNumber = try inputUserNumber()
            
            if userNumber == 0 {
                print("게임 종료")
                
                return
            }
            
            let userHand = try convertEnum(of: userNumber)
            let computerHand = try convertEnum(of: Int.random(in: 1...3))
            
            compare(userHand, and: computerHand)
        } catch ConsoleError.inputError {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            currentPlayer = .computer
            startGame()
        } catch {
            print("알 수 없는 에러가 발생했습니다.")
        }
    }
    
    private func inputUserNumber() throws -> Int {
        print("[\(currentPlayer.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
        
        guard let input = readLine(), let userNumber = Int(input), 0...3 ~= userNumber else {
            throw ConsoleError.inputError
        }
        
        return userNumber
    }
    
    private func convertEnum(of number: Int) throws -> MukJiPpa {
        switch number {
        case 1:
            return .muk
        case 2:
            return .ji
        case 3:
            return .ppa
        default:
            throw ConsoleError.inputError
        }
    }
    
    private func compare(_ userHand: MukJiPpa, and computerHand: MukJiPpa) {
        if userHand == computerHand {
            print("\(currentPlayer.rawValue)의 승리")
        } else if isUserTurn(userHand, computerHand) {
            currentPlayer = .user
            print("\(currentPlayer.rawValue)의 턴입니다.")
            startGame()
        } else {
            currentPlayer = .computer
            print("\(currentPlayer.rawValue)의 턴입니다.")
            startGame()
        }
    }
    
    private func isUserTurn(_ user: MukJiPpa, _ computer: MukJiPpa) -> Bool {
        return user == .muk && computer == .ji
        || user == .ji && computer == .ppa
        || user == .ppa && computer == .muk
    }
}


