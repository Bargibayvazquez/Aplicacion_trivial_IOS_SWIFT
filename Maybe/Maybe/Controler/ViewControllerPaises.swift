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

    @IBOutlet weak var P1: UIButton!
    @IBOutlet weak var P2: UIButton!
    @IBOutlet weak var P3: UIButton!
    @IBOutlet weak var LabelContador: UILabel!
    @IBOutlet weak var LabelPais: UILabel!
    @IBOutlet weak var Bandera: UIImageView!

    override func viewDidLoad() {
       
        super.viewDidLoad()
        cargarPreguntas()
        NuevaPregunta()
        actualizarPuntuacion()
        LabelContador.text = "Puntuación   \(puntuacionP)"
    }

    func cargarPreguntas() {
        let preguntas = [
            PreguntaPais(imagenPais: UIImage(named: "Mexico")!, respuestaPais: ["Mexico", "Italia", "Irlanda"], correctoPais: 0),
            PreguntaPais(imagenPais: UIImage(named: "Japon")!, respuestaPais: ["China", "Japon", "Bangladesh"], correctoPais: 1),
            PreguntaPais(imagenPais: UIImage(named: "Finlandia")!, respuestaPais: ["Finlandia", "Dinamarca", "Suecia"], correctoPais: 0),
            PreguntaPais(imagenPais: UIImage(named: "Espana")!, respuestaPais: ["Espana", "Colombia", "Macedonia"], correctoPais: 0),
            PreguntaPais(imagenPais: UIImage(named: "Dinamarca")!, respuestaPais: ["Finlandia", "Dinamarca", "Suecia"], correctoPais: 1),
            PreguntaPais(imagenPais: UIImage(named: "corea.svg")!, respuestaPais: ["corea del norte", "Egipto", "corea del sur"], correctoPais: 2),
            PreguntaPais(imagenPais: UIImage(named: "Bangladesh.svg")!, respuestaPais: ["Pakistan", "Bangladesh", "India"], correctoPais: 1),
            PreguntaPais(imagenPais: UIImage(named: "Alemania")!, respuestaPais: ["Francia", "Belgica", "Alemania"], correctoPais: 2),
            PreguntaPais(imagenPais: UIImage(named: "Pakistan.svg")!, respuestaPais: ["Pakistan", "Bangladesh", "India"], correctoPais: 0)
        ]
        preguntasDisponibles = Set(preguntas)
    }

    func NuevaPregunta() {
        LabelContador.textColor = UIColor.white
        if let pregunta = preguntasDisponibles.randomElement() {
            preguntaActual = pregunta
            preguntasDisponibles.remove(pregunta)
            Bandera.image = pregunta.imagenPais
            P1.setTitle(pregunta.respuestaPais[0], for: .normal)
            P2.setTitle(pregunta.respuestaPais[1], for: .normal)
            P3.setTitle(pregunta.respuestaPais[2], for: .normal)
        } else {
            terminarJuego()
        }
    }

    func respuestaUsuario(respuestaSeleccionada: Int) {
        if let preguntaActual = preguntaActual {
            if respuestaSeleccionada < preguntaActual.respuestaPais.count {
                if respuestaSeleccionada == preguntaActual.correctoPais {
                    puntuacionP += 1
                    LabelContador.textColor = UIColor.green // Cambia a color verde
                } else {
                    puntuacionP -= 1
                    LabelContador.textColor = UIColor.red
                    print("Respuesta incorrecta. Sigue intentando.")
                }
            }
        }
        actualizarPuntuacion()
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
        actualizarPuntuacion()
    }

    func actualizarPuntuacion() {
       
        LabelContador.text = "Puntuación   \(puntuacionP)"
    }

    @IBAction func ActionP1(_ sender: Any) {
        respuestaUsuario(respuestaSeleccionada: 0)
    }

    @IBAction func ActionP2(_ sender: Any) {
        respuestaUsuario(respuestaSeleccionada: 1)
    }

    @IBAction func ActionP3(_ sender: Any) {
        respuestaUsuario(respuestaSeleccionada: 2)
    }
}
