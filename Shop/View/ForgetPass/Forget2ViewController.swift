//
//  Forget2ViewController.swift
//  Shop
//
//  Created by hamza-dridi on 12/11/2022.
//

import UIKit

class Forget2ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var code1: UITextField!
    @IBOutlet weak var code2: UITextField!
    @IBOutlet weak var code3: UITextField!
    @IBOutlet weak var code4: UITextField!
      var maxLen:Int = 1;
    public var SuccessMessage:Message = Message(message: "")

      var codetyped : String = ""
      var code :String?
      var Lastcode :String?
      var Email :String?
      fileprivate let baseURLRender = "http://172.17.1.50:2500/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        code1.delegate = self
        code2.delegate = self
        code3.delegate = self
        code4.delegate = self        // Do any additional setup after loading the view.
        
        let preferences = UserDefaults.standard

              let currentLevelKey = "currentLevel"
              if preferences.object(forKey: currentLevelKey) == nil {
                  //  Doesn't exist
              } else {
                  let currentLevel = preferences.integer(forKey: currentLevelKey)
                  print("shih " , currentLevel)
                  Lastcode =  "\(currentLevel)"
              }
       }
       
       func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

           if(textField == code1){
              let currentText = textField.text! + string
              return currentText.count <= maxLen
           }
           if(textField == code2){
              let currentText = textField.text! + string
              return currentText.count <= maxLen
           }
           if(textField == code3){
              let currentText = textField.text! + string
              return currentText.count <= maxLen
           }
           if(textField == code4){
              let currentText = textField.text! + string
              return currentText.count <= maxLen
           }
           return true;
         }
    
    
    
    
    @IBAction func btnRetour(_ sender: Any) {
        
        
         performSegue(withIdentifier: "forget2Toforget1", sender: sender)
    }
    
    
    
       
    @IBAction func goToForget3(_ sender: Any) {
        
        var codeee1 : String = ""
         var codeee2 : String = ""
         var codeee3 : String = ""
         var codeee4 : String = ""
         
          codeee1 = code1.text!
          codeee2 = code2.text!
          codeee3 = code3.text!
          codeee4 = code4.text!
         

         codetyped = codeee1 + codeee2 + codeee3 + codeee4
         print("codetyped" , codetyped + "Lastcode"  , Lastcode)
         
      
        // print("codetyped "+ codetyped! )
         if(codetyped  == "")
         {
             let alert = UIAlertController(title: " field is empty".localizedForget1, message: "please fill your inputs".localizedForget1, preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: "ok".localizedForget1, style: .default, handler: nil))
             self.present(alert, animated: true)
             
         }
  else if (Lastcode == codetyped)
  {
     
      performSegue(withIdentifier: "forget3", sender: sender)

  }
        else if (Lastcode != codetyped){
            let alert = UIAlertController(title: " code incorrect".localizedForget1, message: "please fill your inputs".localizedForget1, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok".localizedForget1, style: .default, handler: nil))
            self.present(alert, animated: true)
        }
         
     }
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "forget3" {
           let des = segue.destination as! Forget3ViewController
        
           des.Email = Email
             
     }
     
     
 }
    
}

extension String {
    var localizedForget1: String {
        return NSLocalizedString(self, comment: "")
    }
}
