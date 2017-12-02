//
//  SecondViewController.swift
//  Capital City Quiz
//
//  Created by Jae Guk Lee on 11/26/17.
//  Copyright © 2017 Jae Guk Lee. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var questionAnswer: UILabel!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!

    let allQuestions = EuropeQuestionBAnk()
    var questionNumber : Int = 0
    var senderRandom : Int = 0
    var random1 : Int = 0
    var random2 : Int = 0
    var random3 : Int = 0
    
    var score : Int = 0
    var answer : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    
    }
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        // set the answer according to the one being pressed
        if sender.tag == 1{
            answer = sender.title(for: .normal )
        }else if sender.tag == 2{
            answer = sender.title(for: .normal )
        }else if sender.tag == 3{
            answer = sender.title(for: .normal )
        }else{
            answer = sender.title(for: .normal )
        }
        
        // check answer
        if answer == allQuestions.list[questionNumber].capitalCity{
            ProgressHUD.showSuccess("맞아요!")
            score += 1
        }else{
            ProgressHUD.showError("틀려요!")
        }
        
        //Let's create a delay! So that user experience is better!
        //First, let's disable the buttons
        button1.isEnabled = false
        button2.isEnabled = false
        button3.isEnabled = false
        button4.isEnabled = false
        
        // This is delay!
        let when = DispatchTime.now() + 1 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            // Your code with delay
            self.button1.isEnabled = true
            self.button2.isEnabled = true
            self.button3.isEnabled = true
            self.button4.isEnabled = true
        }

        //Increase question number
        questionNumber += 1
        
        //Conditionals
        if questionNumber < allQuestions.list.count{
            update()

        }else{
            
            //After all the questions
            questionText.text = "점수: \(score)/\(allQuestions.list.count)"
            questionAnswer.text = ""
            
            //Should I also make the multiple choices blank?
            button1.setTitle("", for: .normal)
            button2.setTitle("", for: .normal)
            button3.setTitle("", for: .normal)
            button4.setTitle("", for: .normal)
        }
    }
    
    
    func update(){
        //Initial view of question and answer
        questionText.text = allQuestions.list[questionNumber].country
        questionAnswer.text = allQuestions.list[questionNumber].capitalCity
        
        //Have to assign random number to other remaining buttons.
        senderRandom = Int(arc4random_uniform(4)) + 1
        random1 = Int(arc4random_uniform(UInt32(allQuestions.list.count)))
        random2 = Int(arc4random_uniform(UInt32(allQuestions.list.count)))
        random3 = Int(arc4random_uniform(UInt32(allQuestions.list.count)))
        
        while questionNumber == random1 || questionNumber == random2 || questionNumber == random3 || random1 == random2 || random1 == random3 || random2 == random3{
            random1 = Int(arc4random_uniform(UInt32(allQuestions.list.count)))
            random2 = Int(arc4random_uniform(UInt32(allQuestions.list.count)))
            random3 = Int(arc4random_uniform(UInt32(allQuestions.list.count)))
        }

        
        if senderRandom == 1{
            button1.setTitle(allQuestions.list[questionNumber].capitalCity, for: .normal)
            button2.setTitle(allQuestions.list[random1].capitalCity, for: .normal)
            button3.setTitle(allQuestions.list[random2].capitalCity, for: .normal)
            button4.setTitle(allQuestions.list[random3].capitalCity, for: .normal)
        
        }else if senderRandom == 2{
            button2.setTitle(allQuestions.list[questionNumber].capitalCity, for: .normal)
            button1.setTitle(allQuestions.list[random1].capitalCity, for: .normal)
            button3.setTitle(allQuestions.list[random2].capitalCity, for: .normal)
            button4.setTitle(allQuestions.list[random3].capitalCity, for: .normal)
            
        }else if senderRandom == 3{
            button3.setTitle(allQuestions.list[questionNumber].capitalCity, for: .normal)
            button2.setTitle(allQuestions.list[random1].capitalCity, for: .normal)
            button4.setTitle(allQuestions.list[random2].capitalCity, for: .normal)
            button1.setTitle(allQuestions.list[random3].capitalCity, for: .normal)
            
        }else{
            button4.setTitle(allQuestions.list[questionNumber].capitalCity, for: .normal)
            button2.setTitle(allQuestions.list[random1].capitalCity, for: .normal)
            button3.setTitle(allQuestions.list[random2].capitalCity, for: .normal)
            button1.setTitle(allQuestions.list[random3].capitalCity, for: .normal)
            
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
