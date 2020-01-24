

import UIKit
import Toast_Swift

class ViewController: UIViewController,UITextFieldDelegate
{

    
    //textfields
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var mobileNoTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var ageTF: UITextField!
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        specifyKeyboards()
       nameTF.delegate=self
       mobileNoTF.delegate=self
        emailTF.delegate=self
        ageTF.delegate=self
    }
    
    
    func specifyKeyboards()
    {
        ageTF.keyboardType = .numberPad
        
        emailTF.keyboardType = .emailAddress
        
        mobileNoTF.keyboardType = .phonePad
        
        
}
      var returnVal:Bool = false
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        //to get one by one textfields
        if(textField==nameTF)
        {
            return true
        }

  

        if(textField==ageTF)
        {
            if(nameTF.text!.count > 1 )
            {
                return true
            }
            else
            {
                return false
            }
        }
        if(textField==emailTF)
        {

            if(nameTF.text!.count > 1 && ageTF.text!.count <= 100)
            {
                return true
            }
            else
            {
                return false
            }

        }
        if(textField==mobileNoTF)
        {
            if(nameTF.text!.count > 1 && ageTF.text!.count <= 100 && emailTF.text!.count > 1)
            
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
        if(textField==nameTF)
        {
            returnVal = isValidName(Input: textField.text!)
            
        }
        if(textField==ageTF)
        {
            
            
            if(Int(ageTF.text!)! < 100)
            {
                returnVal = isValidAge(Input: textField.text!)
            }
            else
            {
                returnVal = false
            }
        }
        if(textField==emailTF)
        {
            returnVal = isValidEmail(emailStr: textField.text!)
            
        }
        if(textField==mobileNoTF)
        {
            
            if(mobileNoTF.text!.count == 10)
            {
                returnVal = isValidMobileNum(Input: textField.text!)
            }
            else
            {
                returnVal = false
            }
            
            
            
            
        }
        return returnVal
    }
    
    
        //regular expression functions
    
        func isValidName(Input:String) -> Bool {
            let ReGEx = "[A-Za-z ]{2,20}"
            let Test = NSPredicate(format:"SELF MATCHES %@", ReGEx)
            return Test.evaluate(with:Input)
        }
        func isValidAge(Input:String) -> Bool {
            let ReGEx = "[0-9 ]{2,3}"
            let Test = NSPredicate(format:"SELF MATCHES %@", ReGEx)
            return Test.evaluate(with:Input)
        }
       func isValidEmail(emailStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailStr)
        
    }
        func isValidMobileNum(Input:String) -> Bool {
            let ReGEx = "^[6-9][0-9]{9}$";
            let Test = NSPredicate(format:"SELF MATCHES %@", ReGEx)
            return Test.evaluate(with:Input)
        }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //using characterset
        if(textField==nameTF)
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
            if(textField==ageTF)
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
                if(textField==emailTF)
                {
                    let nameCharSet=CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@. ")
                    if(string.rangeOfCharacter(from: nameCharSet) != nil || string == "")
                    {
                        returnVal=true
                    }
                        
                    else
                    {
                        returnVal=false
                        self.view.makeToast("Enter Only EmailFormat", duration: 1.0, position: .top)
                    }
                    }
        if(textField==mobileNoTF)
        {
            let nameCharSet=CharacterSet(charactersIn: "0123456789  ")
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
        return returnVal
    }
    @IBAction func nextButtonEH(_ sender: Any)
    {
        if((isValidName(Input: nameTF.text!)==true && isValidAge(Input: ageTF.text!) && isValidEmail(emailStr: emailTF.text!)==true) && isValidMobileNum(Input:mobileNoTF.text!)==true)
        {
        
        DataTransfer.data.name = nameTF.text!
            
        
            
            
        DataTransfer.data.age = Int(ageTF.text!)
        
        DataTransfer.data.email = emailTF.text
        
        DataTransfer.data.mobileNum = mobileNoTF.text
        
        let targetVC = self.storyboard?.instantiateViewController(withIdentifier: "secondVC")
        
        present(targetVC!, animated: true, completion: nil)
    }
    }

        
        
}


