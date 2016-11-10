//
//  DetailsEntryViewController.swift
//  DataRecorder
//
//  Created by Student on 09/10/2016.
//  Copyright © 2016 GS. All rights reserved.
//

import UIKit

class DetailsEntryViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var enterYear: UITextField!
    
    @IBOutlet var nextButton: UIButton!

    @IBOutlet var currentCountry: UIButton!
    
    @IBOutlet var gender: UISegmentedControl!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
//    func textField(_ textField: enterYear, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        let text: NSString = (textField.text ?? "") as NSString
//        let resultString = text.replacingCharacters(in: range, with: string)
//        
//        return true
//    }

    
    func flag(country:String) -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in country.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.enterYear.delegate = self;
        enterYear.keyboardType = UIKeyboardType.numberPad
        currentCountry.setTitle(flag(country: "IE"), for: .normal)
        self.enterYear.becomeFirstResponder()
    }
    
    @IBAction func enterYearChanged(_ sender: UITextField) {
        if (enterYear.text?.characters.count)! >= 2{
            enterYear.resignFirstResponder()
        }
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let dvc = segue.destination as? NumbersEntryViewController {

            dvc.language = currentCountry.title(for: .normal)!
            dvc.age = enterYear.text!
            dvc.gender = gender.titleForSegment(at: gender.selectedSegmentIndex)!
            
        }
    }

    @IBAction func unwindfromCollectionView(segue: UIStoryboardSegue) {
        if let svc = segue.source as? CollectionViewController {
            //self.touchesCount = svc.points.count
            currentCountry.setTitle(flag(country: svc.dataToSend), for: .normal)

        }
        
    }
    
}