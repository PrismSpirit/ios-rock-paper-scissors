//
//  RPSGameManager.swift
//  Created by Wonbi, 미니
//


class RPSGameManager {
	@discardableResult
	func startGame() -> GameState {
		let userCard = fetchUserInput()
		let result = checkValidable(of: userCard)
		
		return result
	}
	
	private func fetchUserInput() -> Result<RPS, InputError> {
		print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
		
		guard let inputValue = readLine(),
			  let inputNumber = Int(inputValue),
			  0...3 ~= inputNumber else { return .failure(.invalidNumber) }
		
		if inputNumber == 0 {
			return .failure(.exitGame)
		} else if let inputCard = RPS(rawValue: inputNumber) {
			return .success(inputCard)
		} else {
			return .failure(.invalidNumber)
		}
	}

	private func checkValidable(of userInputResult: Result<RPS, InputError>) -> GameState {
		switch userInputResult {
		case .success(let inputCard):
			return inputCard.generateGameResult()
			
		case .failure(let error):
			handleInputError(error)
			return .draw
		}
	}

	private func handleInputError(_ error: InputError) {
		print(error.description)
		if error == .invalidNumber {
			startGame()
		}
	}
}
