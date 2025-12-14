//
//  ViewController.swift
//  T2_DiegoBerastain
//
//  Created by user286645 on 12/13/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pesoTextField: UITextField!
    @IBOutlet weak var estaturaTextField: UITextField!
    @IBOutlet weak var calcularButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        configurarVista()
        configurarTextFields()
    }

    func configurarVista() {
        title = "Calculadora de IMC"

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ocultarTeclado))
        view.addGestureRecognizer(tapGesture)
    }

    func configurarTextFields() {
        pesoTextField.keyboardType = .decimalPad
        estaturaTextField.keyboardType = .decimalPad
    }

    @objc func ocultarTeclado() {
        view.endEditing(true)
    }

    @IBAction func calcularPressed(_ sender: UIButton) {
        guard let pesoTexto = pesoTextField.text, !pesoTexto.isEmpty,
              let estaturaTexto = estaturaTextField.text, !estaturaTexto.isEmpty,
              let peso = Double(pesoTexto),
              let estatura = Double(estaturaTexto),
              peso > 0, estatura > 0 else {
            mostrarAlerta(mensaje: "Por favor ingresa valores válidos para peso y estatura")
            return
        }

        let imc = calcularIMC(peso: peso, estatura: estatura)

        navegarAResultado(imc: imc, peso: peso, estatura: estatura)
    }

    func calcularIMC(peso: Double, estatura: Double) -> Double {
        return peso / (estatura * estatura)
    }

    func navegarAResultado(imc: Double, peso: Double, estatura: Double) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let resultVC = storyboard.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController {
            resultVC.imc = imc
            resultVC.peso = peso
            resultVC.estatura = estatura
            resultVC.modalPresentationStyle = .fullScreen
            present(resultVC, animated: true, completion: nil)
        }
    }

    func mostrarAlerta(mensaje: String) {
        let alerta = UIAlertController(title: "Error", message: mensaje, preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alerta, animated: true, completion: nil)
    }
}

