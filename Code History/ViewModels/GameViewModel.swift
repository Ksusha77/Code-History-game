//
//  GameViewModel.swift
//  Code History
//
//  Created by Ксения Левицкая on 6/13/24.
//

import SwiftUI

class GameViewModel: ObservableObject{
    
    @Published private var game = Game()
    
    
    var currentQuestion: Question {
         game.currentQuestion
    }
    
    var correctGuesses: Int {
        game.guessCount.correct
    }
        
    var incorrectGuesses: Int {
        game.guessCount.incorrect
    }

    
    var questionProgressText: String {
        "\(game.currentQuestionIndex + 1) / \(game.numberOfQuestions)"
    }
    
    var guessWasMade: Bool {
            if let _ = game.guesses[currentQuestion] {
                return true
            } else {
                return false
            }
    }
    
    var gameIsOver: Bool {
      game.isOver
    }

        
    // MARK: - Internal Methods
    // 2
    func makeGuess(atIndex index: Int) {
        game.makeGuessForCurrentQuestion(atIndex: index)
    }
        // 3
    func displayNextScreen() {
        game.updateGameStatus()
    }
    
    func color(forOptionIndex optionIndex: Int) -> Color {
             if let guessedIndex = game.guesses[currentQuestion] {
                 if guessedIndex != optionIndex {
                     return GameColor.main
                 } else if guessedIndex == currentQuestion.correctAnswerIndex {
                     return GameColor.correctGuess
                 } else {
                     return GameColor.incorrectGuess
                 }
             } else {
                 return GameColor.main
             }
    }
}

