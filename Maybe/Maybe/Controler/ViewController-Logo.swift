import UIKit

struct PreguntaLogo: Hashable  {
    let imagenLogo: UIImage
    let respuestaLogo: [String]
    let correctoLogo: Int
}

class ViewControllerLogo: UIViewController {
    var puntuacionL: Int = 0
    var preguntasDisponibles = Set<PreguntaLogo>()
    var preguntaActual: PreguntaLogo?
    
    @IBOutlet weak var ImagensLogo: UIImageView!
    @IBOutlet weak var LabelContador: UILabel!
    @IBOutlet weak var BOpcion1: UIButton!
    @IBOutlet weak var BOcion2: UIButton!
    @IBOutlet weak var BOcion3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cargarPreguntas()
        NuevaPregunta()
        actualizarPuntuacion()
    }
    
    func cargarPreguntas() {
        let preguntas = [
            PreguntaLogo(imagenLogo: UIImage(named: "pepsi")!, respuestaLogo: ["pepsi", "Coca-Cola", "Monster"], correctoLogo: 0),
            PreguntaLogo(imagenLogo: UIImage(named: "reddit")!, respuestaLogo: ["Telegram", "reddit", "Discord"], correctoLogo: 1),
            PreguntaLogo(imagenLogo: UIImage(named: "Tinder")!, respuestaLogo: ["Tinder", "Badoo", "Adopta"], correctoLogo: 0),
            PreguntaLogo(imagenLogo: UIImage(named: "Mozilla")!, respuestaLogo: ["Mozilla", "Chrome", "Opera"], correctoLogo: 0),
            PreguntaLogo(imagenLogo: UIImage(named: "Mastercard")!, respuestaLogo: ["American", "Mastercard", "Visa"], correctoLogo: 1),
            PreguntaLogo(imagenLogo: UIImage(named: "waze")!, respuestaLogo: ["Google-Maps", "mapas", "waze"], correctoLogo: 2),
            PreguntaLogo(imagenLogo: UIImage(named: "McDonalds-logo")!, respuestaLogo: ["Burger King", "Mcdonalds", "Carls jr"], correctoLogo: 1),
            PreguntaLogo(imagenLogo: UIImage(named: "Mercedes-Benz")!, respuestaLogo: ["BMW", "Audi", "Mercedes"], correctoLogo:2 ),
            PreguntaLogo(imagenLogo: UIImage(named: "Microsoft")!, respuestaLogo: ["Microsoft", "Sony", "Lg"], correctoLogo: 0),
            PreguntaLogo(imagenLogo: UIImage(named: "Shazma")!, respuestaLogo: ["Shazam", "Spotify", "Audacity"], correctoLogo: 0),
            PreguntaLogo(imagenLogo: UIImage(named: "Snapchat-logotipo")!, respuestaLogo: ["Instagram", "Snapchat", "Twitter"], correctoLogo: 1),
            PreguntaLogo(imagenLogo: UIImage(named: "Tesla_T_symbol.svg")!, respuestaLogo: ["Audi", "Tesla", "Bmw"], correctoLogo: 1),
            PreguntaLogo(imagenLogo: UIImage(named: "adidas")!, respuestaLogo: ["Nike", "adidas", "NB"], correctoLogo: 1),
            PreguntaLogo(imagenLogo: UIImage(named: "Airbnb-Logotipo")!, respuestaLogo: ["adidas", "Airbnb", "VRBO"], correctoLogo: 0),
            PreguntaLogo(imagenLogo: UIImage(named: "dropbox")!, respuestaLogo: ["dropbox", "Chrome", "OneDrive"], correctoLogo: 0),
            PreguntaLogo(imagenLogo: UIImage(named: "Logotipo-Amazon")!, respuestaLogo: ["Fedex", "UPS", "Amazon"], correctoLogo: 2),
            PreguntaLogo(imagenLogo: UIImage(named: "Twitter")!, respuestaLogo: ["Facebook", "Instagram", "Twitter"], correctoLogo: 2)
        ]
        preguntasDisponibles = Set(preguntas)
    }
    
    func NuevaPregunta() {
        if let pregunta = preguntasDisponibles.randomElement() {
            preguntaActual = pregunta
            preguntasDisponibles.remove(pregunta)
            ImagensLogo.image = pregunta.imagenLogo
            BOpcion1.setTitle(pregunta.respuestaLogo[0], for: .normal)
            BOcion2.setTitle(pregunta.respuestaLogo[1], for: .normal)
            BOcion3.setTitle(pregunta.respuestaLogo[2], for: .normal)
        } else {
            terminarJuego()
        }
    }
    
    func respuestaUsuario(respuestaSeleccionada: Int) {
        if let preguntaActual = preguntaActual {
            if respuestaSeleccionada < preguntaActual.respuestaLogo.count {
                if respuestaSeleccionada == preguntaActual.correctoLogo {
                    puntuacionL += 1
                } else {
                    puntuacionL -= 1
                    print("Respuesta incorrecta. Sigue intentando.")
                }
            }
        }
        NuevaPregunta()
    }
    
    func terminarJuego() {
        let mensaje = "¡Juego terminado!\nTu puntuación final es: \(puntuacionL)"
        
        let alertController = UIAlertController(title: "Fin del Juego", message: mensaje, preferredStyle: .alert)
        let reiniciarAction = UIAlertAction(title: "Volver a Jugar", style: .default) { (_) in
            self.reiniciarJuego()
        }
        alertController.addAction(reiniciarAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func reiniciarJuego() {
        puntuacionL = 0
        cargarPreguntas()
        NuevaPregunta()
        actualizarPuntuacion()
    }
    
    func actualizarPuntuacion() {
        LabelContador.text = "¿Lo adivinas?"
    }
    
    @IBAction func actionO1(_ sender: UIButton) {
        respuestaUsuario(respuestaSeleccionada: 0)
    }
    
    @IBAction func actionO2(_ sender: AnyObject) {
        respuestaUsuario(respuestaSeleccionada: 1)
    }
    
    @IBAction func actionO3(_ sender: AnyObject) {
        respuestaUsuario(respuestaSeleccionada: 2)
    }
}
