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
    
    func buscar(terminación : String){
        
        let terminaciónBusqueda : String = terminación
        let urls = "http://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:\(terminaciónBusqueda)"
        let url = NSURL(string : urls)
        let datos : NSData? = NSData(contentsOf : url! as URL)
        
        if (datos != nil){
            //Pasar los datos obtenidos en UTF8 a String
            let texto = NSString(data: datos! as Data, encoding: String.Encoding.utf8.rawValue)
            //Mostrar datos por pantalla
            print(texto!)
            //Mostrar datos en textView
            visorDeTexto.textColor = UIColor.black
            visorDeTexto.text = texto as String!
        }else{ //Si no hay datos (fallo en la conexión a Internet)
            //Mostrar mensaje de error
            let alerta = UIAlertController(title: "Error", message: "Error en la conección a internet", preferredStyle: .alert)
            
            let cancelar = UIAlertAction(title: "Cancelar", style: .cancel)
            
            alerta.addAction(cancelar)
            
            present(alerta, animated: true)
        
        }

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
        
        buscar(terminación: textodeBusqueda.text!)
        
        
    }
    


}

