//
//  UIKButtonEvent.swift
//  Pods
//
//  Created by Saulo Tauil on 2016-11-10.
//
//

import Foundation


import Foundation
import UIKit


var ButtonClickClosureKey : Int16 = 0;

extension UIButton {
    
    public typealias ClickClosure =  ((_ sender: UIButton)->Void);
    
    
    class ClickEventWrapper {
        var closure: ClickClosure?
        init(closure: @escaping ClickClosure) {
            self.closure = closure;
        }
    }
    
    public func onClick( handler: @escaping ClickClosure){
        
        
        objc_setAssociatedObject(self, &ButtonClickClosureKey, ClickEventWrapper(closure: handler) , .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        addTarget(self, action: #selector(executeClick), for: .touchUpInside)
        
        
    }
    
    func executeClick() -> Void {
        if let wrapper = objc_getAssociatedObject(self, &ButtonClickClosureKey) as? ClickEventWrapper
        {
            wrapper.closure!(self);
        }
    }
    
}
