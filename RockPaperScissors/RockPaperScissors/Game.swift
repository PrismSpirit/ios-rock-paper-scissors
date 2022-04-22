//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by 그루트, 예톤 on 2022/04/18.
//

struct Game {
    private var userChoice: GameRockPaperScissorsChoice?
    private var computerChoice: GameRockPaperScissorsChoice?
    private var isUserTurn = false
    private var isSameChoice = false
    
    mutating func execute() {
        GameStatus.rockPaperScissorsMenu.printMessage()
        inputUserSelect()
        
        if verifyUserSelection() == true {
            decideGameStart()
        } else {
            GameStatus.error.printMessage()
            execute()
        }
    }
    
    private mutating func inputUserSelect() {
        let userChoiceNumber = Int(readLine() ?? "")
        userChoice = changeToGameChoice(from: userChoiceNumber)
    }
    
    private func verifyUserSelection() -> Bool {
        switch userChoice {
        case .end,
            .scissors,
            .rock,
            .paper:
            return true
        default:
            return false
        }
    }
    
    private mutating func decideGameStart() {
        if userChoice == .end {
            GameStatus.end.printMessage()
        } else {
            printGameResult()
        }
    }
    
    private mutating func printGameResult() {
        switch compareChoice() {
        case .draw:
            GameStatus.draw.printMessage()
            execute()
        case .win:
            GameStatus.win.printMessage()
            isUserTurn = true
            executeMukChiBa()
        case .lose:
            GameStatus.lose.printMessage()
            isUserTurn = false
            executeMukChiBa()
        default:
            break
        }
    }
    
    private mutating func compareChoice() -> GameResult? {
        let computerChoiceNumber = Int.random(in: GameRockPaperScissorsChoice.scissors.number...GameRockPaperScissorsChoice.paper.number)
        computerChoice = changeToGameChoice(from: computerChoiceNumber)
        
        switch userChoice {
        case computerChoice:
            return .draw
        case .scissors:
            return compareScissorsOfUser(with: computerChoice)
        case .paper:
            return comparePaperOfUser(with: computerChoice)
        case .rock:
            return compareRockOfUser(with: computerChoice)
        default:
            return nil
        }
    }
    
    private func compareScissorsOfUser(with computerChoice: GameRockPaperScissorsChoice?) -> GameResult {
        return computerChoice == .paper ? .win : .lose
    }
    
    private func comparePaperOfUser(with computerChoice: GameRockPaperScissorsChoice?) -> GameResult {
        return computerChoice == .rock ? .win : .lose
    }
    
    private func compareRockOfUser(with computerChoice: GameRockPaperScissorsChoice?) -> GameResult {
        return computerChoice == .scissors ? .win : .lose
    }
    
    private func changeToGameChoice(from number: Int?) -> GameRockPaperScissorsChoice? {
        switch number {
        case GameRockPaperScissorsChoice.end.number:
            return .end
        case GameRockPaperScissorsChoice.scissors.number:
            return .scissors
        case GameRockPaperScissorsChoice.paper.number:
            return .paper
        case GameRockPaperScissorsChoice.rock.number:
            return .rock
        default:
            return nil
        }
    }
}

extension Game {
    private var userMukChiBaChoice: GameMukChiBaChoice? {
        switch userChoice?.number {
        case GameRockPaperScissorsChoice.end.number:
            return .end
        case GameRockPaperScissorsChoice.scissors.number:
            return .muk
        case GameRockPaperScissorsChoice.rock.number:
            return .chi
        case GameRockPaperScissorsChoice.paper.number:
            return .ba
        default:
            return nil
        }
    }
    
    private var computerMukChiBaChoice: GameMukChiBaChoice? {
        switch computerChoice?.number {
        case GameRockPaperScissorsChoice.end.number:
            return .end
        case GameRockPaperScissorsChoice.scissors.number:
            return .muk
        case GameRockPaperScissorsChoice.rock.number:
            return .chi
        case GameRockPaperScissorsChoice.paper.number:
            return .ba
        default:
            return nil
        }
    }
    
    private mutating func executeMukChiBa() {
        printMukChiBaMenu()
        inputUserSelect()
        
        if verifyUserSelection() == true {
            decideMukChiBaStart()
        } else {
            isUserTurn = false
            
            GameStatus.error.printMessage()
            executeMukChiBa()
        }
    }
    
    private func printMukChiBaMenu() {
        if isUserTurn == true {
            GameStatus.userTurnMukChibaMenu.printMessage()
        } else {
            GameStatus.computerTurnMukChibaMenu.printMessage()
        }
    }
    
    private mutating func decideMukChiBaStart() {
        if userMukChiBaChoice == .end {
            GameStatus.end.printMessage()
        } else {
            decideSameChoice()
            printMukChiBaResult()
        }
    }
    
    private mutating func changeTurn() {
        isUserTurn = isUserTurn ? false : true
    }
    
    private mutating func decideSameChoice() {
        let computerChoiceNumber = Int.random(in: GameRockPaperScissorsChoice.scissors.number...GameRockPaperScissorsChoice.paper.number)
        computerChoice = changeToGameChoice(from: computerChoiceNumber)
        
        if userMukChiBaChoice == computerMukChiBaChoice {
            isSameChoice = true
        } else {
            isSameChoice = false
        }
    }
    
    private mutating func printMukChiBaResult() {
        switch (isUserTurn, isSameChoice) {
        case (true, true):
            GameStatus.userWin.printMessage()
            GameStatus.end.printMessage()
        case (true, false):
            changeTurn()
            GameStatus.computerTurn.printMessage()
            executeMukChiBa()
        case (false, true):
            GameStatus.computerWin.printMessage()
            GameStatus.end.printMessage()
        case (false, false):
            changeTurn()
            GameStatus.userTurn.printMessage()
            executeMukChiBa()
        }
    }
}
