//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!

    var quizBrain = QuizBrain();

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let answer = sender.titleLabel?.text
        var rightResponse = quizBrain.checkAnswer(answer!);
         
        if rightResponse {
            print("Rigt answer")
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        quizBrain.updateDisplayedAnswer();

        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.quiz[quizBrain.questionNumber].text
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        print(Float(quizBrain.questionNumber)/Float(quizBrain.quiz.count-1))
        progressBar.progress = Float(quizBrain.questionNumber)/Float(quizBrain.quiz.count-1)
        print(progressBar.progress)
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    }
      

}

