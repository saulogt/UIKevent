//
//  UIKTextFieldEvent.swift
//  Pods
//
//  Created by Saulo Tauil on 2016-11-10.
//
//

import Foundation



import Foundation
import UIKit


var TextFieldChangedClosureKey : Int16 = 0;

extension UITextField {
    
    public typealias SliderChangeClosure =  ((_ sender: UITextField)->Void);
    
    
    class TextFieldChangeEventWrapper {
        var closure: SliderChangeClosure?
        init(closure: @escaping SliderChangeClosure) {
            self.closure = closure;
        }
    }
    
    public func onChange( handler: @escaping SliderChangeClosure){
        
        
        objc_setAssociatedObject(self, &TextFieldChangedClosureKey, TextFieldChangeEventWrapper(closure: handler) , .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        addTarget(self, action: #selector(executeChange), for: .editingChanged)
        
        
    }
    
    func executeChange() -> Void {
        if let wrapper = objc_getAssociatedObject(self, &TextFieldChangedClosureKey) as? TextFieldChangeEventWrapper
        {
            wrapper.closure!(self);
        }
    }
    
}
