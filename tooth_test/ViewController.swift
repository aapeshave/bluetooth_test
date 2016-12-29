//
//  ViewController.swift
//  tooth_test
//
//  Created by Ajinkya Peshave on 12/29/16.
//  Copyright © 2016 Ajinkya Peshave. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController {

    var centralManager: CBCentralManager?
    var peripherals: Array<CBPeripheral> = Array<CBPeripheral>()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Initialise CoreBluetooth Central Manager
        centralManager = CBCentralManager(delegate: self, queue: DispatchQueue.main)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func onClickScan(_ sender: UIButton) {
        self.centralManager?.scanForPeripherals(withServices: nil, options: [CBCentralManagerScanOptionAllowDuplicatesKey : false])
    }


}

extension ViewController: CBCentralManagerDelegate, CBPeripheralDelegate
{
     public func centralManagerDidUpdateState(_ central: CBCentralManager)
     {
        if (central.state == CBManagerState.poweredOn)
        {
            //self.centralManager?.scanForPeripherals(withServices: nil, options: nil)
        }
        else
        {
            // do something like alert the user that ble is not on
        }
    }
    public func centralManager(_ central: CBCentralManager,
                               didDiscover peripheral: CBPeripheral,
                               advertisementData: [String : Any],
                               rssi RSSI: NSNumber)
    {
        // print(peripheral)
        peripherals.append(peripheral)
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    //UITableView methods
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:BluetoothTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell")! as! BluetoothTableViewCell
        
        let peripheral = peripherals[indexPath.row]
        cell.lbl_deviceName.text = peripheral.name
        cell.lbl_deviceInfo.text = "\(peripheral.identifier)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return peripherals.count
    }
}

