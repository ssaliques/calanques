//
//  BoutonArrondi.swift
//  Les Calanques
//
//  Created by Sébastien SALIQUES on 15/06/2020.
//  Copyright © 2020 MassiveDynamic Ltd. All rights reserved.
//

import UIKit

class BoutonArrondi: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        layer.cornerRadius = 10
    }

}
