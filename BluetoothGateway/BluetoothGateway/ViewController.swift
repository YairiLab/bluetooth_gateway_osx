//
//  ViewController.swift
//  BluetoothGateway
//
//  Created by OE Hi Loki on 2018/01/03.
//  Copyright © 2018 Yairi Lab. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, BluetoothInfoDelegate {
    var _central: BTCentral!
    @IBOutlet var _logArea: NSTextView!
    
    @IBAction func scan(_ sender: NSButton) {
        _central.scan()
        Timer.scheduledTimer(withTimeInterval: 10, repeats: false, block: { t in
            self._central.stopScan()
        })
    }
    @IBAction func submit(_ sender: NSButton) {
        _central.submit(s: "Hello")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        _central = BTCentral(delegate: self)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func show(_ s: String) {
        _logArea.string = _logArea.string + s + "\n"
    }
}

