//
//  ViewController.swift
//  Maybe
//
//  Created by Borja on 12/5/23.
//

import UIKit

class ViewController: UIViewController {

    
    
   
    
    
    
    @IBOutlet weak var Contador: UILabel!
    @IBOutlet weak var Prgunta: UILabel!
    
   
    @IBOutlet weak var Verdadero: UIButton!
    
    
    @IBOutlet weak var Falso: UIButton!
   
    
    //Instanciamos la clase estructura.
    
    var estructura = Estructura()
    
    
    
    
    
    //Esta clase es la que hara que vista se vera en la carga inicial.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Prgunta.text = estructura.getTextQuestion()
        
       
        Contador.text = "Puntuación: \(estructura.getScore()) pts."
        
       
        
    }

    
    
    
    
    @IBAction func respuestaDelUsuario(_ sender: UIButton  )  {
        
        let respuesta = sender.titleLabel?.text ?? "Verdadero"
        
        let respuestaCorrecta = estructura.checkAnswer(userAnswer: respuesta)
        
        if respuestaCorrecta {
            //sender.backgroundColor = UIColor.green
            
            self.view.backgroundColor = UIColor.cyan
            // Color de fondo original de la vista principal
                   let originalColor = self.view.backgroundColor
                   
                   // Color de fondo que deseas establecer durante 5 segundos
                   let newColor = UIColor.green
                   
                   // Cambiar el color de fondo durante 5 segundos
                   self.view.backgroundColor = newColor
                   
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                // Volver al color de fondo original con animación
                UIView.animate(withDuration: 0.1) {
                    self.view.backgroundColor = originalColor
                }
            }
            
            
        }else{
            self.view.backgroundColor = UIColor.cyan
            // Color de fondo original de la vista principal
                   let originalColor = self.view.backgroundColor
                   
                   // Color de fondo que deseas establecer durante 5 segundos
                   let newColor = UIColor.red
                   
                   // Cambiar el color de fondo durante 5 segundos
                   self.view.backgroundColor = newColor
                   
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                // Volver al color de fondo original con animación
                UIView.animate(withDuration: 0.1) {
                    self.view.backgroundColor = originalColor
                }
            }
            
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.impactOccurred()
        }
        
        
        Falso.isEnabled = false
        Verdadero.isEnabled = true
        
        
        if estructura.nextQuestion(){
            let alert = UIAlertController(title: "Final del juego", message:"Cerrar la App", preferredStyle: .alert)
            
            
            let si = UIAlertAction(title: "No", style: .default)  { _ in
             
                self.estructura.Contador = 0
           
            }
                
                
            
            
            let no = UIAlertAction(title: "Si", style: .cancel) { _ in
                exit(0)
            }
            
            alert.addAction(si)
            alert.addAction(no)
            present(alert,animated: true)
            
            
            
        }else {
            Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(changeQuestion), userInfo: nil, repeats: false)
        }
        
        
        
        
    }
    @IBAction func RespuestaDelUsuario(_ sender: Any) {
    }
    
    @objc func changeQuestion() {
        
        Prgunta.text = estructura.getTextQuestion()
        Prgunta.textColor = estructura.getColor()
        
        
        Contador.text = "Puntuación : \(estructura.getScore()) pts."
        
        //Falso.backgroundColor = UIColor.purple
        //Verdadero.backgroundColor = UIColor.purple
        
        Falso.isEnabled = true
        Verdadero.isEnabled = true
        
        
    }
    
    
    
}

