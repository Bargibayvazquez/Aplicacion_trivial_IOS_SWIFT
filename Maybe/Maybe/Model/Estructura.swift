//
//  Estructura.swift
//  Maybe
//
//  Created by Borja on 12/5/23.
//

import Foundation
import UIKit

struct Estructura{
    
    let arrayDePreguntas = [
    
        Preguntas (texto: "El dueño de la piedra filosfal en Harry Potter es Nicolas Flamel", respuestas: "Verdadero", color: UIColor.white ),
        Preguntas (texto: "En 1492 se descubrio America", respuestas: "Verdadero", color: UIColor.white ),
        Preguntas (texto: "Adolf hitler no fue elegido democraticamente ", respuestas: "Falso", color: UIColor.white ),
        Preguntas (texto: "La Mona Lisa tiene una ceja desaparecida.", respuestas: "Verdadero", color: UIColor.white ),
        Preguntas (texto: "Las pirámides de Egipto son las estructuras más antiguas del mundo. ", respuestas: "Falso", color: UIColor.white ),
        Preguntas (texto: "El sol es una estrella.", respuestas: "Verdadero", color: UIColor.white ),
        Preguntas (texto: "El Polo Norte se encuentra en la Antártida. ", respuestas: "Falso", color: UIColor.white ),
        Preguntas (texto: "El Papa vive en el Vaticano", respuestas: "Verdadero", color: UIColor.white ),
        Preguntas (texto: "La Mona Lisa de Leonardo da Vinci está exhibida en el Museo del Louvre en París. ", respuestas: "Verdadero", color: UIColor.white ),
        Preguntas (texto: "La Gran Muralla China es visible desde el espacio.", respuestas: "Verdadero", color: UIColor.white ),
        Preguntas (texto: "Eric Cantona protagonizo una patada de karate hacia un aficionado.", respuestas: "Verdadero", color: UIColor.white ),
        Preguntas (texto: "El jugador del AC Milan KAKA fue balón de oro en 2022.", respuestas: "Falso", color: UIColor.white ),
        Preguntas (texto: "La hormiga reina es la más grande en una colonia de hormigas.", respuestas: "Verdadero", color: UIColor.white ),
        Preguntas (texto: "El sushi es originario de Japón.", respuestas: "Verdadero", color: UIColor.white ),
        Preguntas (texto: "La Estatua de la Libertad fue un regalo de Francia a los Estados Unidos.", respuestas: "Verdadero", color: UIColor.white ),
        Preguntas (texto: "El café es originario de Italia.", respuestas: "Falso", color: UIColor.white )
    
    
    
    ]
    
    
    
    var numPreguntas = 0
    var Contador = 0
    
    
    mutating func checkAnswer(userAnswer:String) -> Bool {
        if userAnswer == arrayDePreguntas[numPreguntas].respuestas {
            Contador += 1
            return true
        }else{
            return false
        }
    }
    
    
    
    func getScore() -> Int {
        return Contador
    }
    
    func getTextQuestion() -> String{
        
        return arrayDePreguntas[numPreguntas].texto
    }
    
    func getColor() -> UIColor {
        
        return arrayDePreguntas[numPreguntas].color
        
        
    }
    
    mutating func nextQuestion() -> Bool {
        
        if numPreguntas + 1 < arrayDePreguntas.count{
            numPreguntas += 1
            return false
        }else{
            return true
        }
        
        
        
    }
    
    
    
    
    
    
    
}
