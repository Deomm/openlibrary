//
//  ViewController.swift
//  OpenLibrary
//
//  Created by David Osses Mena on 10-03-17.
//  Copyright © 2017 David Osses Mena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textodeBusqueda: UITextField!
    @IBOutlet weak var visorDeTexto: UITextView!
    var ISBN : String = ""
    
    func buscar(terminación : String) -> String {
        
        let terminaciónBusqueda : String = terminación
        let urls = "http://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:\(terminaciónBusqueda)"
        let url = NSURL(string : urls)
        let datos : NSData? = NSData(contentsOf : url! as URL)
        
        let texto = NSString(data : datos! as Data, encoding : String.Encoding.utf8.rawValue)
        
        return texto as! String
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    @IBAction func buscarButton(_ sender: Any) {
        
        visorDeTexto.text = String(buscar(terminación: textodeBusqueda.text!))
        
        
    }
    


}

