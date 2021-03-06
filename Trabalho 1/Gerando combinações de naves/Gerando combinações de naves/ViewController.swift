//
//  ViewController.swift
//  Gerando combinações de naves
//
//  Created by Matheus Falcão on 06/04/16.
//  Copyright © 2016 Matheus e Jordana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var naves : [Float] = [1.1, 1.2, 1.3, 1.4, 1.5]
    var navesUsadas = [4, 5, 5, 5, 5]
    var bases : [Float] = [60, 65, 70, 75, 80, 85, 90, 95, 100, 110, 120]
    var tempo : Float = 0.0
    var nave1 : [Int] = []
    var nave2 : [Int] = []
    var nave3 : [Int] = []
    var nave4 : [Int] = []
    var nave5 : [Int] = []
    var melhorNave1 : [Int] = []
    var melhorNave2 : [Int] = []
    var melhorNave3 : [Int] = []
    var melhorNave4 : [Int] = []
    var melhorNave5 : [Int] = []
    var menorTempo : Float = 10000
    var base = 1
    var nave = 0
    var qtdNaves = 0
    var somatorio : Float = 0
    var naveAleatoria = 0
    var contador : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        while(true) {
            
            base = 1
            tempo = 0
            navesUsadas = [4, 5, 5, 5, 5]
            contador = 0
            
            nave1.removeAll()
            nave2.removeAll()
            nave3.removeAll()
            nave4.removeAll()
            nave5.removeAll()
            
            while(base < 12){

                somatorio=0;
                
                qtdNaves = Int(arc4random_uniform(5) + 1)
                
                while(qtdNaves != 0){
                    
                    nave = Int(arc4random_uniform(5) + 1)
                    
                    contador = 0
                    
                    while((navesUsadas[nave-1] == 0 || passouBase(nave, base: base)) && contador < 50){
                        nave = Int(arc4random_uniform(5) + 1)
                        contador++
                    }

                    
                    if(contador < 50){
                        navesUsadas[nave-1]--
                        
                        switch(nave) {
                            
                            case 1:
                                nave1.append(base)
                            
                            case 2:
                                nave2.append(base)
                            
                            case 3:
                                nave3.append(base)
                            
                            case 4:
                                nave4.append(base)
                            
                            case 5:
                                nave5.append(base)
                            
                            default:
                                break;
                            
                        }
                        
                        somatorio = naves[nave-1] + somatorio
                        qtdNaves--
                    
                    } else {
                        qtdNaves = 0
                    }
                
                }
                
                if(contador < 50){
                    tempo = tempo + (bases[base-1]/somatorio)
                    base++
                } else {
                    tempo = 10000
                    base = 12
                }
            
            }
            
            if(menorTempo > tempo){
                menorTempo = tempo
                melhorNave1 = nave1
                melhorNave2 = nave2
                melhorNave3 = nave3
                melhorNave4 = nave4
                melhorNave5 = nave5
            }
            
            print("melhor tempo: \(menorTempo) \n");
            print("nave1: \(melhorNave1)")
            print("nave2: \(melhorNave2)")
            print("nave3: \(melhorNave3)")
            print("nave4: \(melhorNave4)")
            print("nave5: \(melhorNave5)")
            
            
        }
        
        
    }
    
    func passouBase(nave : Int, base : Int) -> Bool {
        
        switch(nave) {
            
        case 1:
            return nave1.contains(base)
            
        case 2:
            return nave2.contains(base)
            
        case 3:
            return nave3.contains(base)
            
        case 4:
            return nave4.contains(base)
            
        case 5:
            return nave5.contains(base)
            
        default:
            return false
            
        }

        
    }


}

