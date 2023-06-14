import UIKit

struct PreguntaPais: Hashable {
    let imagenPais: UIImage
    let respuestaPais: [String]
    let correctoPais: Int
}

class ViewControllerPais: UIViewController {
    var puntuacionP: Int = 0
    var preguntasDisponibles = Set<PreguntaPais>()
    var preguntaActual: PreguntaPais?
    
    @IBOutlet weak var ImagenPais: UIImageView!
    @IBOutlet weak var LabelColor: UILabel!
    @IBOutlet weak var CajaTexto: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cargarPreguntas()
        NuevaPregunta()
    }
    
    func cargarPreguntas() {
        let preguntas = [
            PreguntaPais(imagenPais: UIImage(named: "Alemania")!, respuestaPais: ["ALEMANIA", "BELGICA", "CANADA"], correctoPais: 0),
            PreguntaPais(imagenPais: UIImage(named: "Bangladesh.svg")!, respuestaPais: ["JAPON", "BANGLADESH", "IRAN"], correctoPais: 1)
            // Resto de las preguntas...
        ]
        preguntasDisponibles = Set(preguntas)
    }
    
    func NuevaPregunta() {
        if let pregunta = preguntasDisponibles.randomElement() {
            preguntaActual = pregunta
            preguntasDisponibles.remove(pregunta)
            ImagenPais.image = pregunta.imagenPais
            CajaTexto.text = ""
        } else {
            terminarJuego()
        }
    }
    
    func respuestaUsuario() {
        if let preguntaActual = preguntaActual, let respuestaIngresada = CajaTexto.text?.uppercased() {
            if respuestaIngresada == preguntaActual.respuestaPais[preguntaActual.correctoPais] {
                puntuacionP += 1
                LabelColor.text = "¡Respuesta correcta!"
                LabelColor.textColor = UIColor.green
            } else {
                puntuacionP -= 1
                LabelColor.text = "Respuesta incorrecta. Inténtalo de nuevo."
                LabelColor.textColor = UIColor.red
            }
        }
        NuevaPregunta()
    }
    
    func terminarJuego() {
        let mensaje = "¡Juego terminado!\nTu puntuación final es: \(puntuacionP)"
        
        let alertController = UIAlertController(title: "Fin del Juego", message: mensaje, preferredStyle: .alert)
        let reiniciarAction = UIAlertAction(title: "Volver a Jugar", style: .default) { (_) in
            self.reiniciarJuego()
        }
        alertController.addAction(reiniciarAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func reiniciarJuego() {
        puntuacionP = 0
        cargarPreguntas()
        NuevaPregunta()
        LabelColor.text = ""
    }
    
    @IBAction func responderButtonTapped(_ sender: UIButton) {
        respuestaUsuario()
    }
    
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        sender.text = sender.text?.uppercased()
    }
}
