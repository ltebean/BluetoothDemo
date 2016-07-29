//
//  PeripheralViewController.swift
//  BluetoothDemo
//
//  Created by leo on 16/7/29.
//  Copyright © 2016年 io.ltebean. All rights reserved.
//

import UIKit
import BluetoothKit

class PeripheralViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let peripheral = BKPeripheral()
        do {
            peripheral.delegate = self
            peripheral.addAvailabilityObserver(self)
            let dataServiceUUID = NSUUID(UUIDString: "6E6B5C64-FAF7-40AE-9C21-D4933AF45B23")!
            let dataServiceCharacteristicUUID = NSUUID(UUIDString: "477A2967-1FAB-4DC5-920A-DEE5DE685A3D")!
            let localName = NSBundle.mainBundle().infoDictionary!["CFBundleName"] as? String
            let configuration = BKPeripheralConfiguration(dataServiceUUID: dataServiceUUID, dataServiceCharacteristicUUID: dataServiceCharacteristicUUID, localName: localName)
            try peripheral.startWithConfiguration(configuration)
        } catch let error {
            print("Error starting: \(error)")
        }
    }
    
}

extension PeripheralViewController: BKPeripheralDelegate, BKAvailabilityObserver {

    func peripheral(peripheral: BKPeripheral, remoteCentralDidConnect remoteCentral: BKRemoteCentral) {
        print("connected")
    }

    func peripheral(peripheral: BKPeripheral, remoteCentralDidDisconnect remoteCentral: BKRemoteCentral) {
        print("disconnected")

    }
    
    func central(central: BKCentral, remotePeripheralDidDisconnect remotePeripheral: BKRemotePeripheral) {
        
    }
    func availabilityObserver(availabilityObservable: BKAvailabilityObservable, availabilityDidChange availability: BKAvailability) {
        
    }
    
    func availabilityObserver(availabilityObservable: BKAvailabilityObservable, unavailabilityCauseDidChange unavailabilityCause: BKUnavailabilityCause) {
        
    }

}

