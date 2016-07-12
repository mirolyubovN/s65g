//
//  ViewController.swift
//  Assignment 3
//
//  Created by Nikita Mirolyubov on 06.07.16.
//  Copyright © 2016 MacBookPro. All rights reserved.
//

import UIKit

let beforeArray = TwoDimensional (columns: 20, rows: 20) //if the size of the grid is needed to be changed - this is the only place where it should be done

let afterArray = TwoDimensional (columns: beforeArray.columnsMax, rows: beforeArray.rowsMax)


class ViewController: UIViewController {
    
    
    @IBOutlet var tapGesture: UITapGestureRecognizer!

    @IBOutlet weak var gridView: GridView!
    //var gridView: GridView = GridView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
     
    }

    @IBAction func runButton(sender: UIButton) {
    
        beforeArray.twoDimensionalArray = afterArray.twoDimensionalArray
        afterArray.twoDimensionalArray = step(beforeArray.twoDimensionalArray) //getting the value of afterarray by executing step
        
        gridView.setNeedsDisplay()
       
        
        print(beforeArray.prettyPrint(beforeArray.twoDimensionalArray))
        print(afterArray.prettyPrint(afterArray.twoDimensionalArray)) //checking the result of itteration.
        
        
          }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


    @IBDesignable class GridView: UIView {
    @IBInspectable var isAddButton: Bool = true
        
        @IBInspectable var columns : Int  = 20  {
            
            didSet {
                for _ in 0..<columns {
                    grid.append(Array(count:rows, repeatedValue: CellState.Empty))
                }
            }
        }
        @IBInspectable var rows : Int = 20  {
            
            didSet {
                for _ in 0..<columns {
                    grid.append(Array(count:rows, repeatedValue: CellState.Empty))
                }
            }
        }
        
        @IBInspectable var counter: Int = 0 {
            didSet {
                clearsContextBeforeDrawing = true
                    setNeedsDisplay()
                
            }
        }
    
   
    @IBInspectable var livingColour:UIColor = UIColor.greenColor()
    @IBInspectable var gridColour:UIColor = UIColor.lightGrayColor()
    @IBInspectable var diedColour:UIColor = UIColor.blackColor()
    @IBInspectable var emptyColour:UIColor = UIColor.grayColor()
    @IBInspectable var bornColour:UIColor = UIColor.yellowColor()
    @IBInspectable var gridWidth:CGFloat = CGFloat (2.0)
   
        
    var grid = [[CellState]]()
        
        
        
        

//function for counting living cells
func countAliveCells (beforeArray:[[Bool]], rows:Int, columns:Int)-> Int {
    var aliveCells: Int = 0
    for col in 0..<rows{
        for row in 0..<columns{
            if beforeArray[row][col]{
                aliveCells += 1
            }
        }
    }
    return aliveCells
}
    
    
    
    
    override func drawRect(rect: CGRect) {
        //counter++
        print(counter)
        
      
        let pi:CGFloat = CGFloat(M_PI)
        let radius = (bounds.width/CGFloat(rows+2)-gridWidth)/4
        let arcWidth: CGFloat = 2*radius
        let startAngle: CGFloat = 0
        let endAngle: CGFloat = 2*pi
        
       
        afterArray.twoDimensionalArray = step(beforeArray.twoDimensionalArray)
        print(beforeArray.prettyPrint(beforeArray.twoDimensionalArray))
        print(afterArray.prettyPrint(afterArray.twoDimensionalArray))
        //create the path
        
        let gridPath = UIBezierPath()
        gridPath.lineWidth = gridWidth
        
        var test = CGFloat (1.0)
         //drawing rows
        for _ in 0...rows {
        gridPath.moveToPoint(CGPoint(
            x:bounds.width/CGFloat(rows+2)-gridWidth,
            y:(bounds.height-gridWidth-(bounds.height*test/CGFloat(rows+2)))))
        
        gridPath.addLineToPoint(CGPoint(
            x:bounds.width-bounds.width/CGFloat(rows+2)-gridWidth,
            y:(bounds.height-gridWidth-(bounds.height*test/CGFloat(rows+2)))))
        
        //set the stroke color
        gridColour.setStroke()
        
        //draw the stroke
        gridPath.stroke()
        test += 1.0
        
        }
        test = 1.0
        
        //drawing columns
        
        for _ in 0...columns {
            gridPath.moveToPoint(CGPoint(
                x:bounds.width-gridWidth-(bounds.width*test/CGFloat(rows+2)),
                y:bounds.height/CGFloat(rows+2)-gridWidth))
            
            gridPath.addLineToPoint(CGPoint(
                x:bounds.width-gridWidth-(bounds.width*test/CGFloat(rows+2)),
                y:bounds.height-bounds.height/CGFloat(rows+2)-gridWidth))
            
            //set the stroke color
            gridColour.setStroke()
            
            //draw the stroke
            gridPath.stroke()
            test += 1.0
            
        }
 
        var rowNum = CGFloat (0.0)
        var colNum = CGFloat (0.0)
        
        //drawing cicrles (cells)
        let forrad = 4*radius+gridWidth
        for row in 0..<rows {
            for column in 0..<columns {
                let center = CGPoint(x:(bounds.width/CGFloat(rows+2)*1.5-gridWidth)+rowNum*(forrad),
                             y:(bounds.height/CGFloat(rows+2)*1.5-gridWidth+colNum*(forrad)))
        
                let circlePath = UIBezierPath(arcCenter: center,
                                radius: radius,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
                circlePath.lineWidth = arcWidth
                let previousStatus = beforeArray.twoDimensionalArray[column][row] //made this way to check against prettyPrint function
                let currentStatus = afterArray.twoDimensionalArray[column][row]
                var mystr = grid[row][column]
              
                if currentStatus == false && previousStatus == false {
                    mystr = CellState.Empty
                }
                else if currentStatus == false && previousStatus == true {
                    mystr = CellState.Died
                }
                else if currentStatus == true && previousStatus == false {
                    mystr = CellState.Born
                }
                else if currentStatus == true && previousStatus == true {
                    mystr = CellState.Living
                }
                let colour = mystr.description()
                switch colour {
                case "Living" : livingColour.setStroke()
                case "Empty" : emptyColour.setStroke()
                case "Born" : bornColour.setStroke()
                case "Died" : diedColour.setStroke()
                default : UIColor.blueColor().setStroke()
                    
                }
                circlePath.stroke()
                colNum+=1
            }
            colNum=0
            rowNum+=1
        }
        
    

    }
        override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
            if let touch = touches.first {
                let position :CGPoint = touch.locationInView(self)
                print("x coord:")
                print(position.x)
                print("y coord:")
                print(position.y)
                /*
                var rowNum = CGFloat (0.0)
                var colNum = CGFloat (0.0)
                let pi:CGFloat = CGFloat(M_PI)
                let radius = (bounds.width/CGFloat(rows+2)-gridWidth)/4
                let arcWidth: CGFloat = 2*radius
                let startAngle: CGFloat = 0
                let endAngle: CGFloat = 2*pi
                
                //drawing cicrles (cells)
                let forrad = 4*radius+gridWidth
                for row in 0..<rows {
                    for column in 0..<columns {
                        let center = CGPoint(x:(bounds.width/CGFloat(rows+2)*1.5-gridWidth)+rowNum*(forrad),
                                             y:(bounds.height/CGFloat(rows+2)*1.5-gridWidth+colNum*(forrad)))
                        
                        if (position.x>=center.x-5&&position.x<=center.x+5&&position.y>=center.y-5&&position.y<=center.y+5){
                            let circlePath = UIBezierPath(arcCenter: center,
                                                          radius: radius,
                                                          startAngle: startAngle,
                                                          endAngle: endAngle,
                                                          clockwise: true)
                            circlePath.lineWidth = arcWidth
                            var mystr = grid[row][column]
                            var state = mystr.description()
                            
                            switch state {
                            case "Living" :mystr.toggle(.Living)
                            case "Empty" : mystr.toggle(.Empty)
                            case "Born" : mystr.toggle(.Born)
                            case "Died" : mystr.toggle(.Died)
                            default: break
                            }
                            state = mystr.description()
                            switch state {
                            case "Living" : livingColour.setStroke()
                            case "Empty" : emptyColour.setStroke()
                            case "Born" : bornColour.setStroke()
                            case "Died" : diedColour.setStroke()
                            default : UIColor.blueColor().setStroke()

                            
                            }
                         circlePath.stroke()
                        }
                        
                       
                        colNum+=1
                    }
                    colNum=0
                    rowNum+=1
                }
                */

                
             }

        }
}


enum CellState : String {
    case Living = "Living"
    case Empty = "Empty"
    case Born = "Born"
    case Died = "Died"
    
    func description() -> String {
        switch self{
        default:return self.rawValue
       
        }

    }


    func allValues () -> [String] {
        return ["Living","Empty","Born","Died"]
    }
    
    func toggle(value:CellState)-> CellState{
        switch value {
        case .Empty, .Died:
            return .Living
        case .Living, .Born:
            return .Empty
        }
    }
    
    
}
