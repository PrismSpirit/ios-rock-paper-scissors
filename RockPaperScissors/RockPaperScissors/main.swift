enum Hand: String {
    case exitGame = "0"
    case scissors = "1"
    case rock = "2"
    case paper = "3"
}

func startGame() -> Void {
    showStartMessage()
}

func showStartMessage() -> Void {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    recieveInput()
}

func recieveInput() -> Void {
    if let input = readLine() {
        testValid(of: input)
    } else {
        showErrorMessage()
    }
}

func testValid(of input: String) -> Void {
    switch input {
    case "0":
        print("게임 종료")
        return
    case "1":
        judgeWinner(userChoice: Hand.scissors)
    case "2":
        judgeWinner(userChoice: Hand.rock)
    case "3":
        judgeWinner(userChoice: Hand.paper)
    default:
        showErrorMessage()
    }
}

func showErrorMessage() -> Void {
    print("잘못된 입력입니다. 다시 시도해주세요.")
    showStartMessage()
}

func judgeWinner(userChoice: Hand) -> Void {
    let computerChoice = generateComputerChoice()

    if userChoice == computerChoice {
        print("비겼습니다!")
        showStartMessage()
    } else {
        pickWinner(userChoice: userChoice, computerChoice: computerChoice)
    }
}

func generateComputerChoice() -> Hand {
    let randomNumber = Int.random(in: 1...3)
    
    if randomNumber == 1 {
       return Hand.scissors
    } else if randomNumber == 2 {
       return Hand.rock
    } else {
       return Hand.paper
    }
}

func pickWinner(userChoice: Hand, computerChoice: Hand) -> Void {
    switch userChoice {
    case .scissors where (computerChoice == .paper):
        print("이겼습니다!")
    case .rock where (computerChoice == .scissors):
        print("이겼습니다!")
    case .paper where (computerChoice == .rock):
        print("이겼습니다!")
    default:
        print("졌습니다!")
    }
    showStartMessage()
}

startGame()
