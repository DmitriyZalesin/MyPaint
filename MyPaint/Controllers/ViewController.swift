//
//  ViewController.swift
//  MyPaint
//
//  Created by Dmitriy Zalesin on 4/18/18.
//  Copyright © 2018 TM All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var drawingArea: DrawingView!
    @IBOutlet weak var widthSelect: UISegmentedControl!
    @IBOutlet weak var colorSelect: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func getRandomColor() -> UIColor{
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    
    @IBAction func tap(_ sender: Any) {
        //self.view.backgroundColor = getRandomColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save(_ sender: Any) {
        //Сохраняем изображение в фотопленку айфона и отчищаем экран для следующего изображения
        UIGraphicsBeginImageContextWithOptions(drawingArea.bounds.size, true, 0)
        drawingArea.drawHierarchy(in: drawingArea.bounds, afterScreenUpdates: false)
        UIImageWriteToSavedPhotosAlbum(UIGraphicsGetImageFromCurrentImageContext()!, self, nil, nil)
        drawingArea.pointsPicture = []
        drawingArea.setNeedsDisplay()
        
    }
    
    @IBAction func width(_ sender: Any) {
        takeChoise(widthSelect.selectedSegmentIndex, val: true)
    }
    
    @IBAction func color(_ sender: Any) {
        takeChoise(colorSelect.selectedSegmentIndex, val: false)
    }
    
    func takeChoise(_ param: Int, val: Bool)
    {
        let chooseWidth: CGFloat!
        let chooseColor: UIColor!
        switch param {
        case 0:
            chooseWidth = 5
            chooseColor = UIColor.black
        case 1:
            chooseWidth = 10
            chooseColor = UIColor.blue
        case 2:
            chooseWidth = 15
            chooseColor = getRandomColor()
        case 3:
            chooseWidth = 20
            chooseColor = UIColor.orange
        case 4:
            chooseWidth = 25
            chooseColor = UIColor.green
        default:
            chooseWidth = 10
            chooseColor = UIColor.black
        }
        if(val){
            drawingArea.brWidth = chooseWidth * 1.127
        }
        else{
            drawingArea.drawColor = chooseColor
        }
    }
}

