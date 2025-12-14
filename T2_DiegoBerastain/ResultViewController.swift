//
//  ResultViewController.swift
//  T2_DiegoBerastain
//
//  Created by user286645 on 12/13/25.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var imcLabel: UILabel!
    @IBOutlet weak var categoriaLabel: UILabel!
    @IBOutlet weak var pesoLabel: UILabel!
    @IBOutlet weak var estaturaLabel: UILabel!

    var imc: Double = 0.0
    var peso: Double = 0.0
    var estatura: Double = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()

        mostrarResultados()
    }

    func mostrarResultados() {
        pesoLabel.text = "Peso: \(String(format: "%.1f", peso)) kg"
        estaturaLabel.text = "Estatura: \(String(format: "%.2f", estatura)) m"
        imcLabel.text = "IMC: \(String(format: "%.2f", imc))"

        let categoria = obtenerCategoria(imc: imc)
        categoriaLabel.text = categoria
        categoriaLabel.textColor = obtenerColor(imc: imc)
    }

    func obtenerCategoria(imc: Double) -> String {
        switch imc {
        case 0..<18.5:
            return "Bajo peso"
        case 18.5..<25:
            return "Peso normal"
        case 25..<30:
            return "Sobrepeso"
        case 30..<35:
            return "Obesidad grado I"
        case 35..<40:
            return "Obesidad grado II"
        default:
            return "Obesidad grado III"
        }
    }

    func obtenerColor(imc: Double) -> UIColor {
        switch imc {
        case 0..<18.5:
            return .systemBlue
        case 18.5..<25:
            return .systemGreen
        case 25..<30:
            return .systemYellow
        case 30..<35:
            return .systemOrange
        default:
            return .systemRed
        }
    }

    @IBAction func volverPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
