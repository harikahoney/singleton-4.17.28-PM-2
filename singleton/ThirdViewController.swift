

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var ageLbl: UILabel!
    
    @IBOutlet weak var emailLbl: UILabel!
    
    @IBOutlet weak var mobileLbl: UILabel!
    
    @IBOutlet weak var qualificationLbl: UILabel!
    
    @IBOutlet weak var yearOfPassLbl: UILabel!
    
    @IBOutlet weak var percentageLbl: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        nameLbl.text = "Name:  " + DataTransfer.data.name!
        
        ageLbl.text = "Age:  " + String(DataTransfer.data.age!)
        
        emailLbl.text = "Email Id:  " + DataTransfer.data.email!
        
        mobileLbl.text = "Mobile No:  " + DataTransfer.data.mobileNum!
        
        qualificationLbl.text = "Qualification:  " + DataTransfer.data.qualification!
        
        yearOfPassLbl.text =  "Year Of Passout:  " + DataTransfer.data.yearOfPass!
        
        percentageLbl.text = "Percentage:   " + String(DataTransfer.data.percentage!)

    }
    
    @IBAction func backButtonEH(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    

}
