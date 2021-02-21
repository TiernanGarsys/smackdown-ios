//
//  String.swift
//  smackdown
//
//  Created by Tiernan Garsys on 2/3/21.
//

extension String
{   
    func trim() -> String
   {
    return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
   }
}
