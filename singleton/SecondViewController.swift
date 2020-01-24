

import UIKit

class SecondViewController: UIViewController,UITextFieldDelegate {

    
    
    
    
    @IBOutlet weak var qualificationTF: UITextField!
    
    @IBOutlet weak var passedOutYearTF: UITextField!
    
    @IBOutlet weak var percentageTF: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        qualificationTF.delegate=self
        passedOutYearTF.delegate=self
        percentageTF.delegate=self
        percentageTF.keyboardType = .phonePad
        passedOutYearTF.keyboardType = .numberPad
    }
        var returnVal:Bool = false
        func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
        {
            //to get one by one textfields
            if(textField==qualificationTF)
            {
                return true
            }
            
            
            
            if(textField==passedOutYearTF)
            {
                if(qualificationTF.text!.count > 1 )
                {
                    return true
                }
                else
                {
                    return false
                }
            }
            if(textField==percentageTF)
            {
                
                if(qualificationTF.text!.count > 1 && passedOutYearTF.text!.count > 1)
                {
                    return true
                }
                else
                {
                    return false
                }
                
            }
            
            return true
        }
        
        func textFieldShouldEndEditing(_ textField: UITextField) -> Bool
        {
            
            //calling the functions according to textfields
            if(textField==qualificationTF)
            {
                returnVal = isValidQualification(Input: textField.text!)
                
            }
            if(textField==passedOutYearTF)
            {
                 returnVal = isValidPassedOut(Input: textField.text!)
            }
            if(textField==percentageTF)
            {
                returnVal = isValidPercentage(Input: textField.text!)
            }
            
            return returnVal
    }
      
        //regular expression functions
        
            
            func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
            {
                //using characterset
                if(textField==qualificationTF)
                {
                    let nameCharSet=CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ")
                    if(string.rangeOfCharacter(from: nameCharSet) != nil || string == "")
                    {
                        returnVal=true
                    }
                        
                    else
                    {
                        returnVal=false
                        self.view.makeToast("Enter Only Alphabets", duration: 1.0, position: .top)
                    }
                }
                if(textField==passedOutYearTF)
                {
                    let nameCharSet=CharacterSet(charactersIn: "0123456789 ")
                    if(string.rangeOfCharacter(from: nameCharSet) != nil || string == "")
                    {
                        returnVal=true
                    }
                        
                    else
                    {
                        returnVal=false
                        self.view.makeToast("Enter Only Numbers", duration: 1.0, position: .top)
                    }
                }
                if(textField==percentageTF)
                {
                    let nameCharSet=CharacterSet(charactersIn: "0123456789. ")
                    if(string.rangeOfCharacter(from: nameCharSet) != nil || string == "")
                    {
                        returnVal=true
                    }
                        
                    else
                    {
                        returnVal=false
                        self.view.makeToast("Enter Only percentage", duration: 1.0, position: .top)
                    }
                }
                return returnVal
            }
            
    
            //functions regular expression
            
            func isValidQualification(Input:String) -> Bool
            {
                let ReGEx = "[A-Za-z ]{2,20}"
                let Test = NSPredicate(format:"SELF MATCHES %@", ReGEx)
                return Test.evaluate(with:Input)
            }
            
            
            func isValidPassedOut(Input:String) -> Bool
            {
                let ReGEx = "[0-9 ]{2,4}"
                let Test = NSPredicate(format:"SELF MATCHES %@", ReGEx)
                return Test.evaluate(with:Input)
            }
            
            
            func isValidPercentage(Input:String) -> Bool
            {
                let ReGEx = "[0-9 ]{2,3}"
                let Test = NSPredicate(format:"SELF MATCHES %@", ReGEx)
                return Test.evaluate(with:Input)
                
            }
            
            
        //next button Event Handler
    @IBAction func nextButtonEH(_ sender: Any)
    {
        if(isValidQualification(Input: qualificationTF.text!) == true && isValidPassedOut(Input: passedOutYearTF.text!) == true && isValidPercentage(Input: percentageTF.text!) == true)
        {
       
            DataTransfer.data.qualification = qualificationTF.text
            
            DataTransfer.data.yearOfPass = passedOutYearTF.text
            
            DataTransfer.data.percentage = Float(percentageTF.text!)
            
            let targetVC = self.storyboard?.instantiateViewController(withIdentifier: "thirdVC")
            
            present(targetVC!, animated: true, completion: nil)
        }
    
    }
    //button event handler
    @IBAction func backButtonEH(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    
    
}


