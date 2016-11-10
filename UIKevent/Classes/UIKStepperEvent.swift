//
//  UIKStepperEvent.swift
//  Pods
//
//  Created by Saulo Tauil on 2016-11-10.
//
//

import Foundation


import Foundation
import UIKit


var StepperChangedClosureKey : Int16 = 0;

extension UIStepper {
    
    public typealias SwitchChangeClosure =  ((_ sender: UIStepper)->Void);
    
    
    class ClickEventWrapper {
        var closure: SwitchChangeClosure?
        init(closure: @escaping SwitchChangeClosure) {
            self.closure = closure;
        }
    }
    
    public func onChange( handler: @escaping SwitchChangeClosure){
        
        
        objc_setAssociatedObject(self, &StepperChangedClosureKey, ClickEventWrapper(closure: handler) , .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        addTarget(self, action: #selector(executeChange), for: .valueChanged)
        
        
    }
    
    func executeChange() -> Void {
        if let wrapper = objc_getAssociatedObject(self, &StepperChangedClosureKey) as? ClickEventWrapper
        {
            wrapper.closure!(self);
        }
    }
    
}
