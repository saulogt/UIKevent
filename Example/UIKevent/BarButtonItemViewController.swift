//
//  ViewController.swift
//  UIKevent
//
//  Created by Saulo Tauil on 2016-11-09.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class BarButtonItemViewController: UIViewController {

    @IBOutlet weak var barButton: UIBarButtonItem!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var segControll: UISegmentedControl!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var swt: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        barButton.onClick {_ in
            print("Clicked");
        };
        
        button.onClick { (btn) in
            print("Button clicked");
        }
        
        swt.onChange(handler: { ctrl in
            print("swt changed");

        })
        
        slider.onChange { (sld) in
            print("slider change to \(sld.value)");
        }
        
        stepper.onChange { (obj) in
            print("stepper change to \(obj.value)");
        }

        segControll.onChange { (obj) in
            print("seg change to \(obj.selectedSegmentIndex)");
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
