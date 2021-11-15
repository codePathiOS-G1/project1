//
//  LoginViewController.swift
//  nutritionFitness
//
//  Created by Michael Fang on 11/8/21.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Basic labels and text fields (Login)
    @IBOutlet weak var loginTitle: UILabel!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    // Basic labels and text fields (Signup)
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var registerUsername: UITextField!
    @IBOutlet weak var resgisterPassword: UITextField!
    
    // Login
    @IBAction func onLogin(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) {
            (user, error )in
            if user != nil{
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    // Go to signup screen
    @IBAction func onSignup(_ sender: Any) {
        self.performSegue(withIdentifier: "signupSegue", sender: nil)
    }
    
    // New user sign up
    @IBAction func onNewUserSignup(_ sender: Any) {
        let user = PFUser()
        
        user.email = emailField.text
        user.username = registerUsername.text
        user.password = resgisterPassword.text
        
        user.signUpInBackground{(success, error) in
            if success {
                self.performSegue(withIdentifier: "successfulSignup", sender: nil)
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
