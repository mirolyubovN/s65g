//
//  Engine.swift
//  Assignment2
//
//  Created by Nikita Mirolyubov on 02.07.16.
//  Copyright © 2016 MacBookPro. All rights reserved.
//

import Foundation

func step (beforeArray:[[Bool]]) -> [[Bool]] {
    
    //declaring AFTER array

    let afterArray = TwoDimensional (columns: beforeArray.count, rows: beforeArray.count)
    let rows = beforeArray.count
    let columns = beforeArray.count


    

    var aliveNeighbours = 0
    for col in 0..<columns{
        for row in 0..<rows{
          
            let coordinatesOfNeighbours = step2((row, col), columns: columns, rows: rows) //get the coordinates of neighbours
           
            for neighbours in coordinatesOfNeighbours {
                if beforeArray[neighbours.0][neighbours.1] {
                    aliveNeighbours+=1
                }
            }
            
            switch aliveNeighbours {
                
            case 0..<2 : afterArray.twoDimensionalArray [row][col] = false
                
            case 2,3 : afterArray.twoDimensionalArray [row][col] = true
                
            default : afterArray.twoDimensionalArray [row][col] = false
            }
            aliveNeighbours = 0
            
            
        }
    }

    
    return afterArray.twoDimensionalArray
}


//function for counting living cells
func countAliveCells (beforeArray:[[Bool]], rows:Int, columns:Int)-> Int {
    var aliveCells: Int = 0
    for col in 0..<columns{
        for row in 0..<rows{
            if beforeArray[row][col]{
                aliveCells += 1
            }
        }
    }
    return aliveCells
    
}
// for some unknown reasons step 2 func is needed to execute func neighbours which seems pointless
func step2 (coordinates:(Int,Int), columns:Int, rows: Int) -> [(Int,Int)]{
    let row = coordinates.0
    let col = coordinates.1
    let coordinatesOfNeighbours = neighbours((row, col), columns: columns, rows: rows)
    return coordinatesOfNeighbours
}
func neighbours(coordinates:(Int,Int), columns:Int, rows: Int) -> [(Int,Int)] {
    let row = coordinates.0
    let col = coordinates.1
    //let rows:Int = 5
    //let columns:Int = 5
    let previousRow:Int = (row + rows-1) % rows
    let nextRow:Int = (row+1)%rows
    let previousCol:Int = (col + columns-1) % columns
    let nextCol:Int = (col+1) % columns
    let coordinatesOfNeighbours = [(row,nextCol),(row,previousCol),(nextRow, nextCol),(nextRow, previousCol),(previousRow,previousCol),(previousRow,col),(previousRow,nextCol),(nextRow,col)]
    return coordinatesOfNeighbours
}
