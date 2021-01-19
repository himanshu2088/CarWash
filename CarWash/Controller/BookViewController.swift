//
//  BookViewController.swift
//  CarWash
//
//  Created by Himanshu Joshi on 12/01/21.
//

import UIKit
import Firebase
import SkyFloatingLabelTextField

class BookViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let timeSlots = ["9:00 AM - 11:00AM", "12:00PM - 2:00PM", "3:00PM - 5:00PM"]
    
    var carType: String?
    
    var waterWashBool = false
    var innerVaccumBool = false
    var shinerPolishBool = false
    
    let view1: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.heightAnchor.constraint(equalToConstant: 0.7).isActive = true
        return view
    }()
    
    let bookingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Medium", size: 25.0)
        label.text = "Book Appointment"
        return label
    }()

    let scroll: UIScrollView = {
        let scroll = UIScrollView()
        return scroll
    }()
    
    let carTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Medium", size: 22.0)
        label.text = "Car Type"
        return label
    }()
    
    let hatchBackRound: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "circle (1)"), for: .normal)
        button.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 20.0).isActive = true
        return button
    }()
    
    let sedanRound: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "circle (1)"), for: .normal)
        button.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 20.0).isActive = true
        return button
    }()
    
    let suvRound: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "circle (1)"), for: .normal)
        button.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 20.0).isActive = true
        return button
    }()
    
    let luxuryRound: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "circle (1)"), for: .normal)
        button.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 20.0).isActive = true
        return button
    }()
    
    let hatchBackLabel: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Hatchback", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 20.0)
        button.tintColor = .darkGray
        return button
    }()
    
    let sedanLabel: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sedan", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 20.0)
        button.tintColor = .darkGray
        return button
    }()
    
    let suvLabel: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SUV", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 20.0)
        button.tintColor = .darkGray
        return button
    }()
    
    let luxryLabel: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Luxury", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 20.0)
        button.tintColor = .darkGray
        return button
    }()
    
    let hatchBackImage: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "car-of-hatchback-model"), for: .normal)
        button.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        return button
    }()
    
    let sedanImage: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "car_sedan"), for: .normal)
        button.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        return button
    }()
    
    let suvImage: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "car_suv"), for: .normal)
        button.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        return button
    }()
    
    let luxuryImage: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "car_premium"), for: .normal)
        button.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        return button
    }()
    
    let serviceTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Medium", size: 22.0)
        label.text = "Service Type"
        return label
    }()
    
    let waterWashRound: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "square"), for: .normal)
        button.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 20.0).isActive = true
        return button
    }()
    
    let innerVaccumRound: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "square"), for: .normal)
        button.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 20.0).isActive = true
        return button
    }()
    
    let shinerPolishRound: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "square"), for: .normal)
        button.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 20.0).isActive = true
        return button
    }()
    
    let waterWashLabel: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Water Wash", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 20.0)
        button.tintColor = .darkGray
        return button
    }()
    
    let innerVaccumLabel: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Inner Vaccum Clean", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 20.0)
        button.tintColor = .darkGray
        return button
    }()
    
    let shinerPolishLabel: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Shiner Polish", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 20.0)
        button.tintColor = .darkGray
        return button
    }()
    
    let carDetailsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Medium", size: 22.0)
        label.text = "Car Details"
        return label
    }()
    
    let carCompanyTxtField: SkyFloatingLabelTextField = {
        let textField = SkyFloatingLabelTextField()
        textField.placeholder = "Car Company"
        return textField
    }()
    
    let carModelTxtField: SkyFloatingLabelTextField = {
        let textField = SkyFloatingLabelTextField()
        textField.placeholder = "Car Model"
        return textField
    }()
    
    let carNumberTxtField: SkyFloatingLabelTextField = {
        let textField = SkyFloatingLabelTextField()
        textField.placeholder = "Car Number"
        return textField
    }()
    
    let scheduleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Medium", size: 22.0)
        label.text = "Schedule Details"
        return label
    }()
    
    let dataPicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        return datePicker
    }()
    
    let timeSelect: SkyFloatingLabelTextField = {
        let textField = SkyFloatingLabelTextField()
        textField.placeholder = "Select Time Slot"
        return textField
    }()
    
    let nextBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 20.0)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.heightAnchor.constraint(equalToConstant: 45.0).isActive = true
        button.layer.cornerRadius = 10.0
        button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40.0).isActive = true
        return button
    }()
    
    @objc func carTypeTapped(_ sender: UIButton) {
        switch sender {
        case hatchBackLabel:
            carType = "Hatchback"
            hatchBackRound.setImage(UIImage(named: "circle"), for: .normal)
            sedanRound.setImage(UIImage(named: "circle (1)"), for: .normal)
            suvRound.setImage(UIImage(named: "circle (1)"), for: .normal)
            luxuryRound.setImage(UIImage(named: "circle (1)"), for: .normal)
        case sedanLabel:
            carType = "Sedan"
            sedanRound.setImage(UIImage(named: "circle"), for: .normal)
            hatchBackRound.setImage(UIImage(named: "circle (1)"), for: .normal)
            suvRound.setImage(UIImage(named: "circle (1)"), for: .normal)
            luxuryRound.setImage(UIImage(named: "circle (1)"), for: .normal)
        case suvLabel:
            carType = "SUV"
            suvRound.setImage(UIImage(named: "circle"), for: .normal)
            sedanRound.setImage(UIImage(named: "circle (1)"), for: .normal)
            hatchBackRound.setImage(UIImage(named: "circle (1)"), for: .normal)
            luxuryRound.setImage(UIImage(named: "circle (1)"), for: .normal)
        case luxryLabel:
            carType = "Luxury"
            luxuryRound.setImage(UIImage(named: "circle"), for: .normal)
            sedanRound.setImage(UIImage(named: "circle (1)"), for: .normal)
            suvRound.setImage(UIImage(named: "circle (1)"), for: .normal)
            hatchBackRound.setImage(UIImage(named: "circle (1)"), for: .normal)
        default:
            print("Default Value")
        }
    }
    
    @objc func serviceTypeTapped(_ sender: UIButton) {
        switch sender {
        case waterWashLabel:
            if waterWashBool {
                waterWashRound.setImage(UIImage(named: "square"), for: .normal)
                waterWashBool = false
            } else {
                waterWashRound.setImage(UIImage(named: "check-box"), for: .normal)
                waterWashBool = true
            }
        case innerVaccumLabel:
            if innerVaccumBool {
                innerVaccumRound.setImage(UIImage(named: "square"), for: .normal)
                innerVaccumBool = false
            } else {
                innerVaccumRound.setImage(UIImage(named: "check-box"), for: .normal)
                innerVaccumBool = true
            }
        case shinerPolishLabel:
            if shinerPolishBool {
                shinerPolishRound.setImage(UIImage(named: "square"), for: .normal)
                shinerPolishBool = false
            } else {
                shinerPolishRound.setImage(UIImage(named: "check-box"), for: .normal)
                shinerPolishBool = true
            }
        default:
            print("Default Value")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(cancelDatePicker))

        toolbar.setItems([spaceButton,cancelButton], animated: false)

        timeSelect.inputAccessoryView = toolbar
        
        let picker = UIPickerView()
        timeSelect.inputView = picker
        picker.delegate = self
        
        self.view.addSubview(view1)
        view1.translatesAutoresizingMaskIntoConstraints = false
        view1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 70.0).isActive = true
        view1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        view1.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        self.view1.addSubview(bookingLabel)
        bookingLabel.translatesAutoresizingMaskIntoConstraints = false
        bookingLabel.centerXAnchor.constraint(equalTo: self.view1.centerXAnchor).isActive = true
        bookingLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30.0).isActive = true
        
        self.view.addSubview(scroll)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.topAnchor.constraint(equalTo: self.view1.bottomAnchor).isActive = true
        scroll.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        scroll.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        scroll.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        
        self.scroll.addSubview(carTypeLabel)
        carTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        carTypeLabel.topAnchor.constraint(equalTo: self.scroll.topAnchor, constant: 20.0).isActive = true
        carTypeLabel.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 20.0).isActive = true
        
        self.scroll.addSubview(hatchBackRound)
        hatchBackRound.translatesAutoresizingMaskIntoConstraints = false
        hatchBackRound.topAnchor.constraint(equalTo: self.carTypeLabel.bottomAnchor, constant: 20.0).isActive = true
        hatchBackRound.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 20.0).isActive = true
        
        self.scroll.addSubview(hatchBackLabel)
        hatchBackLabel.translatesAutoresizingMaskIntoConstraints = false
        hatchBackLabel.centerYAnchor.constraint(equalTo: self.hatchBackRound.centerYAnchor).isActive = true
        hatchBackLabel.leadingAnchor.constraint(equalTo: hatchBackRound.trailingAnchor, constant: 20.0).isActive = true
        hatchBackLabel.addTarget(self, action: #selector(carTypeTapped(_:)), for: .touchUpInside)
        
        self.scroll.addSubview(hatchBackImage)
        hatchBackImage.translatesAutoresizingMaskIntoConstraints = false
        hatchBackImage.topAnchor.constraint(equalTo: self.hatchBackRound.bottomAnchor, constant: 15.0).isActive = true
        hatchBackImage.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 70.0).isActive = true
        
        self.scroll.addSubview(sedanRound)
        sedanRound.translatesAutoresizingMaskIntoConstraints = false
        sedanRound.topAnchor.constraint(equalTo: self.hatchBackImage.bottomAnchor, constant: 20.0).isActive = true
        sedanRound.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 20.0).isActive = true
        
        self.scroll.addSubview(sedanLabel)
        sedanLabel.translatesAutoresizingMaskIntoConstraints = false
        sedanLabel.centerYAnchor.constraint(equalTo: self.sedanRound.centerYAnchor).isActive = true
        sedanLabel.leadingAnchor.constraint(equalTo: sedanRound.trailingAnchor, constant: 20.0).isActive = true
        sedanLabel.addTarget(self, action: #selector(carTypeTapped(_:)), for: .touchUpInside)
        
        self.scroll.addSubview(sedanImage)
        sedanImage.translatesAutoresizingMaskIntoConstraints = false
        sedanImage.topAnchor.constraint(equalTo: self.sedanRound.bottomAnchor, constant: 15.0).isActive = true
        sedanImage.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 70.0).isActive = true
        
        self.scroll.addSubview(suvRound)
        suvRound.translatesAutoresizingMaskIntoConstraints = false
        suvRound.topAnchor.constraint(equalTo: self.sedanImage.bottomAnchor, constant: 20.0).isActive = true
        suvRound.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 20.0).isActive = true
        
        self.scroll.addSubview(suvLabel)
        suvLabel.translatesAutoresizingMaskIntoConstraints = false
        suvLabel.centerYAnchor.constraint(equalTo: self.suvRound.centerYAnchor).isActive = true
        suvLabel.leadingAnchor.constraint(equalTo: suvRound.trailingAnchor, constant: 20.0).isActive = true
        suvLabel.addTarget(self, action: #selector(carTypeTapped(_:)), for: .touchUpInside)
        
        self.scroll.addSubview(suvImage)
        suvImage.translatesAutoresizingMaskIntoConstraints = false
        suvImage.topAnchor.constraint(equalTo: self.suvRound.bottomAnchor, constant: 15.0).isActive = true
        suvImage.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 70.0).isActive = true
        
        self.scroll.addSubview(luxuryRound)
        luxuryRound.translatesAutoresizingMaskIntoConstraints = false
        luxuryRound.topAnchor.constraint(equalTo: self.suvImage.bottomAnchor, constant: 20.0).isActive = true
        luxuryRound.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 20.0).isActive = true
        
        self.scroll.addSubview(luxryLabel)
        luxryLabel.translatesAutoresizingMaskIntoConstraints = false
        luxryLabel.centerYAnchor.constraint(equalTo: self.luxuryRound.centerYAnchor).isActive = true
        luxryLabel.leadingAnchor.constraint(equalTo: luxuryRound.trailingAnchor, constant: 20.0).isActive = true
        luxryLabel.addTarget(self, action: #selector(carTypeTapped(_:)), for: .touchUpInside)
        
        self.scroll.addSubview(luxuryImage)
        luxuryImage.translatesAutoresizingMaskIntoConstraints = false
        luxuryImage.topAnchor.constraint(equalTo: self.luxuryRound.bottomAnchor, constant: 15.0).isActive = true
        luxuryImage.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 70.0).isActive = true
        
        self.scroll.addSubview(serviceTypeLabel)
        serviceTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        serviceTypeLabel.topAnchor.constraint(equalTo: self.luxuryImage.bottomAnchor, constant: 30.0).isActive = true
        serviceTypeLabel.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 20.0).isActive = true
        
        self.scroll.addSubview(waterWashRound)
        waterWashRound.translatesAutoresizingMaskIntoConstraints = false
        waterWashRound.topAnchor.constraint(equalTo: self.serviceTypeLabel.bottomAnchor, constant: 20.0).isActive = true
        waterWashRound.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 20.0).isActive = true
        
        self.scroll.addSubview(waterWashLabel)
        waterWashLabel.translatesAutoresizingMaskIntoConstraints = false
        waterWashLabel.centerYAnchor.constraint(equalTo: self.waterWashRound.centerYAnchor).isActive = true
        waterWashLabel.leadingAnchor.constraint(equalTo: waterWashRound.trailingAnchor, constant: 20.0).isActive = true
        waterWashLabel.addTarget(self, action: #selector(serviceTypeTapped(_:)), for: .touchUpInside)
        
        self.scroll.addSubview(innerVaccumRound)
        innerVaccumRound.translatesAutoresizingMaskIntoConstraints = false
        innerVaccumRound.topAnchor.constraint(equalTo: self.waterWashRound.bottomAnchor, constant: 15.0).isActive = true
        innerVaccumRound.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 20.0).isActive = true
        
        self.scroll.addSubview(innerVaccumLabel)
        innerVaccumLabel.translatesAutoresizingMaskIntoConstraints = false
        innerVaccumLabel.centerYAnchor.constraint(equalTo: self.innerVaccumRound.centerYAnchor).isActive = true
        innerVaccumLabel.leadingAnchor.constraint(equalTo: innerVaccumRound.trailingAnchor, constant: 20.0).isActive = true
        innerVaccumLabel.addTarget(self, action: #selector(serviceTypeTapped(_:)), for: .touchUpInside)
        
        self.scroll.addSubview(shinerPolishRound)
        shinerPolishRound.translatesAutoresizingMaskIntoConstraints = false
        shinerPolishRound.topAnchor.constraint(equalTo: self.innerVaccumRound.bottomAnchor, constant: 15.0).isActive = true
        shinerPolishRound.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 20.0).isActive = true
        
        self.scroll.addSubview(shinerPolishLabel)
        shinerPolishLabel.translatesAutoresizingMaskIntoConstraints = false
        shinerPolishLabel.centerYAnchor.constraint(equalTo: self.shinerPolishRound.centerYAnchor).isActive = true
        shinerPolishLabel.leadingAnchor.constraint(equalTo: shinerPolishRound.trailingAnchor, constant: 20.0).isActive = true
        shinerPolishLabel.addTarget(self, action: #selector(serviceTypeTapped(_:)), for: .touchUpInside)
        
        self.scroll.addSubview(carDetailsLabel)
        carDetailsLabel.translatesAutoresizingMaskIntoConstraints = false
        carDetailsLabel.topAnchor.constraint(equalTo: self.shinerPolishRound.bottomAnchor, constant: 30.0).isActive = true
        carDetailsLabel.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 20.0).isActive = true
        
        self.scroll.addSubview(carCompanyTxtField)
        carCompanyTxtField.translatesAutoresizingMaskIntoConstraints = false
        carCompanyTxtField.topAnchor.constraint(equalTo: self.carDetailsLabel.bottomAnchor, constant: 15.0).isActive = true
        carCompanyTxtField.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 20.0).isActive = true
        carCompanyTxtField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0).isActive = true
        
        self.scroll.addSubview(carModelTxtField)
        carModelTxtField.translatesAutoresizingMaskIntoConstraints = false
        carModelTxtField.topAnchor.constraint(equalTo: self.carCompanyTxtField.bottomAnchor, constant: 20.0).isActive = true
        carModelTxtField.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 20.0).isActive = true
        carModelTxtField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0).isActive = true
        
        self.scroll.addSubview(carNumberTxtField)
        carNumberTxtField.translatesAutoresizingMaskIntoConstraints = false
        carNumberTxtField.topAnchor.constraint(equalTo: self.carModelTxtField.bottomAnchor, constant: 20.0).isActive = true
        carNumberTxtField.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 20.0).isActive = true
        carNumberTxtField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0).isActive = true
        
        self.scroll.addSubview(scheduleLabel)
        scheduleLabel.translatesAutoresizingMaskIntoConstraints = false
        scheduleLabel.topAnchor.constraint(equalTo: self.carNumberTxtField.bottomAnchor, constant: 30.0).isActive = true
        scheduleLabel.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 20.0).isActive = true
        
        self.scroll.addSubview(dataPicker)
        dataPicker.translatesAutoresizingMaskIntoConstraints = false
        dataPicker.topAnchor.constraint(equalTo: self.scheduleLabel.bottomAnchor, constant: 20.0).isActive = true
        dataPicker.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 20.0).isActive = true
        
        self.scroll.addSubview(timeSelect)
        timeSelect.translatesAutoresizingMaskIntoConstraints = false
        timeSelect.topAnchor.constraint(equalTo: self.dataPicker.bottomAnchor, constant: 15.0).isActive = true
        timeSelect.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 20.0).isActive = true
        timeSelect.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0).isActive = true
        
        self.scroll.addSubview(nextBtn)
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.topAnchor.constraint(equalTo: self.timeSelect.bottomAnchor, constant: 25.0).isActive = true
        nextBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        nextBtn.bottomAnchor.constraint(equalTo: self.scroll.bottomAnchor, constant: -30.0).isActive = true
        nextBtn.addTarget(self, action: #selector(goToChooseWorkerVC(_:)), for: .touchUpInside)
        
    }
    
    @objc func goToChooseWorkerVC(_ sender: UIButton) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "ChooseWorkerVC") as! ChooseWorkerVC
        guard let carCompanyText = carCompanyTxtField.text, let carModelText = carModelTxtField.text, let carNumberText = carNumberTxtField.text, let timeselectText = timeSelect.text else { return }
        if carCompanyText == "" || carModelText == "" || carNumberText == "" || timeselectText == "" {
            let alert = UIAlertController(title: "Error", message: "Please fill all the information to proceed.", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true) {
                return
            }
        } else {
            if carType == nil {
                let alert = UIAlertController(title: "Error", message: "Please select the car type to proceed.", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(action)
                present(alert, animated: true) {
                    return
                }
            } else {
                if innerVaccumBool == false && waterWashBool == false && shinerPolishBool == false {
                    let alert = UIAlertController(title: "Error", message: "Please select atleast one sevice type to proceed.", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    alert.addAction(action)
                    present(alert, animated: true) {
                        return
                    }
                } else {
                    viewController.carType = carType
                    viewController.innerVaccumBool = innerVaccumBool
                    viewController.waterWashBool = waterWashBool
                    viewController.shinerPolishBool = shinerPolishBool
                    viewController.carCompany = carCompanyTxtField.text
                    viewController.carModelName = carModelTxtField.text
                    viewController.carNumber = carNumberTxtField.text
                    viewController.date = "\(dataPicker.date)"
                    viewController.timeSlot = timeSelect.text
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            }
        }
    }
    
}

//Picker View Methods

extension BookViewController {

   @objc func cancelDatePicker(){
       self.view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return timeSlots.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return timeSlots[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        timeSelect.text = timeSlots[row]
    }
    
}
