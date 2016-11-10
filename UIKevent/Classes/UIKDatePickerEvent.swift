//
//  DatePickerEvent.swift
//  personal budget
//
//  Created by Saulo Tauil on 2016-10-18.
//  Copyright © 2016 Saulo Tauil. All rights reserved.
//

import Foundation
import UIKit

var ChangeClosureKey : Int16 = 0;

extension UIDatePicker {
    
    public typealias ChangeBlock =  ((_ sender: UIDatePicker)->Void);
    
    class ChangeEventWrapper {
        var block: ChangeBlock?
        init(block: @escaping ChangeBlock) {
            self.block = block;
        }
    }
    
    public func onChange(handler : @escaping ChangeBlock){
        
        
        objc_setAssociatedObject(self, &ChangeClosureKey, ChangeEventWrapper(block: handler) , .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        addTarget(self, action: #selector(executeChange), for: .valueChanged)
        
        
    }
    
    func executeChange() -> Void {
        if let wrapper = objc_getAssociatedObject(self, &ChangeClosureKey) as? ChangeEventWrapper
        {
            wrapper.block!(self);
        }
    }
    
}
