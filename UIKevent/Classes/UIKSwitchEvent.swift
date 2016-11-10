//
//  UIKSwitchEvent.swift
//  Pods
//
//  Created by Saulo Tauil on 2016-11-10.
//
//

import Foundation


import Foundation
import UIKit


var SwitchChangedClosureKey : Int16 = 0;

extension UISwitch {
    
    public typealias SwitchChangeClosure =  ((_ sender: UISwitch)->Void);
    
    
    class ClickEventWrapper {
        var closure: SwitchChangeClosure?
        init(closure: @escaping SwitchChangeClosure) {
            self.closure = closure;
        }
    }
    
    public func onChange( handler: @escaping SwitchChangeClosure){
        
        
        objc_setAssociatedObject(self, &SwitchChangedClosureKey, ClickEventWrapper(closure: handler) , .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        addTarget(self, action: #selector(executeChange), for: .valueChanged)
        
        
    }
    
    func executeChange() -> Void {
        if let wrapper = objc_getAssociatedObject(self, &SwitchChangedClosureKey) as? ClickEventWrapper
        {
            wrapper.closure!(self);
        }
    }
    
}
