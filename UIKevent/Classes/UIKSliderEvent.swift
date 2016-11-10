//
//  UIKSliderEvent.swift
//  Pods
//
//  Created by Saulo Tauil on 2016-11-10.
//
//



import Foundation


import Foundation
import UIKit


var SliderChangedClosureKey : Int16 = 0;

extension UISlider {
    
    public typealias SliderChangeClosure =  ((_ sender: UISlider)->Void);
    
    
    class SliderChangeEventWrapper {
        var closure: SliderChangeClosure?
        init(closure: @escaping SliderChangeClosure) {
            self.closure = closure;
        }
    }
    
    public func onChange( handler: @escaping SliderChangeClosure){
        
        
        objc_setAssociatedObject(self, &SliderChangedClosureKey, SliderChangeEventWrapper(closure: handler) , .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        addTarget(self, action: #selector(executeChange), for: .valueChanged)
        
        
    }
    
    func executeChange() -> Void {
        if let wrapper = objc_getAssociatedObject(self, &SliderChangedClosureKey) as? SliderChangeEventWrapper
        {
            wrapper.closure!(self);
        }
    }
    
}
