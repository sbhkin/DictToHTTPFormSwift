//
//  DictToFormData.swift
//
//
//  Created by Ethan on 27/7/15.
//  Copyright (c) 2015 EthanolStudio.com All rights reserved.
//

import Foundation
import UIKit

extension Dictionary {
    func formDataString() -> NSData {
        var str = ""
        var t = 0
        for (key, value) in self {
            if (value as? String) == "" {
                continue
            }
            if (key as? String) == "zombie" {
                continue
            }
            if t == 0 {
                str = "\(key)=\(value)"
                t++
            }else {
                str = "\(str)&\(key)=\(value)"
            }
        }
        str = str.stringByReplacingOccurrencesOfString(" ", withString: "%20", options: NSStringCompareOptions.LiteralSearch, range: nil)
        str = str.stringByReplacingOccurrencesOfString("@", withString: "%40", options: NSStringCompareOptions.LiteralSearch, range: nil)
        print("request params: \(str)")
//        str = str.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
//       println(str)
        return str.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)!
    }
    func formDataStringAllowingEmpty() -> NSData {
        var str = ""
        var t = 0
        for (key, value) in self {
            if (key as? String) == "zombie" {
                continue
            }
            if t == 0 {
                str = "\(key)=\(value)"
                t++
            }else {
                str = "\(str)&\(key)=\(value)"
            }
        }
        str = str.stringByReplacingOccurrencesOfString(" ", withString: "%20", options: NSStringCompareOptions.LiteralSearch, range: nil)
        str = str.stringByReplacingOccurrencesOfString("@", withString: "%40", options: NSStringCompareOptions.LiteralSearch, range: nil)
        print("request params: \(str)")
        //        str = str.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        //       println(str)
        return str.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)!
    }
}
