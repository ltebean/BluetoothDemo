//
//  CentralViewController.swift
//  BluetoothDemo
//
//  Created by leo on 16/7/29.
//  Copyright © 2016年 io.ltebean. All rights reserved.
//

import UIKit
import BluetoothKit

class CentralViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let central = BKCentral()
        central.delegate = self
        central.addAvailabilityObserver(self)
        do {
            let serviceUUID = NSUUID(UUIDString: "6E6B5C64-FAF7-40AE-9C21-D4933AF45B23")!
            let characteristicUUID = NSUUID(UUIDString: "477A2967-1FAB-4DC5-920A-DEE5DE685A3D")!
            let configuration = BKConfiguration(dataServiceUUID: serviceUUID, dataServiceCharacteristicUUID: characteristicUUID)
            try central.startWithConfiguration(configuration)
            // Once the availability observer has been positively notified, you're ready to discover and connect to peripherals.
        } catch let error {
            // Handle error.
            print(error)
        }
        
        central.scanContinuouslyWithChangeHandler({ changes, discoveries in
            // Handle changes to "availabile" discoveries, [BKDiscoveriesChange].
            // Handle current "available" discoveries, [BKDiscovery].
            // This is where you'd ie. update a table view.
            print(changes, discoveries)
            }, stateHandler: { newState in
                // Handle newState, BKCentral.ContinuousScanState.
                // This is where you'd ie. start/stop an activity indicator.
                print(newState)

            }, duration: 3, inBetweenDelay: 3, errorHandler: { error in
                // Handle error.
                print(error)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension CentralViewController: BKAvailabilityObserver, BKCentralDelegate {
    
    func central(central: BKCentral, remotePeripheralDidDisconnect remotePeripheral: BKRemotePeripheral) {
        
    }
    func availabilityObserver(availabilityObservable: BKAvailabilityObservable, availabilityDidChange availability: BKAvailability) {
        
    }
    
    func availabilityObserver(availabilityObservable: BKAvailabilityObservable, unavailabilityCauseDidChange unavailabilityCause: BKUnavailabilityCause) {
        
    }

}