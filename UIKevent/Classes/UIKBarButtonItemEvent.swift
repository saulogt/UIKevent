//
//  BarButtonItemEvent.swift
//  personal_budget
//
//  Created by Saulo Tauil on 2016-11-08.
//  Copyright © 2016 Saulo Tauil. All rights reserved.
//

import Foundation
import UIKit


var BarItemClickClosureKey : Int16 = 0;

extension UIBarButtonItem {
    
    public typealias ClickClosure =  ((_ sender: UIBarButtonItem)->Void);

    
    class ClickEventWrapper {
        var closure: ClickClosure?
        init(closure: @escaping ClickClosure) {
            self.closure = closure;
        }
    }
    
    public func onClick( handler: @escaping ClickClosure){
        
        
        objc_setAssociatedObject(self, &BarItemClickClosureKey, ClickEventWrapper(closure: handler) , .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        target = self;
        action = #selector(executeClick)
        
        
    }
    
    func executeClick() -> Void {
        if let wrapper = objc_getAssociatedObject(self, &BarItemClickClosureKey) as? ClickEventWrapper
        {
            wrapper.closure!(self);
        }
    }
    
}
