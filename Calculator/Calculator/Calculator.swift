import Foundation

struct Calculator{
    var prevVal: String = ""
    var newVal: String = ""
    var resultVal: String = ""
    var mathOperator: String = ""
    var decimalClicked: Bool = false
    
    mutating func numberButtonClicked(_ num: String) -> String{
        if(!resultVal.isEmpty){
            self.newVal = num
            self.resultVal = ""
        } else {
            if(num == "."){
                if (self.decimalClicked != true){
                    self.newVal += num
                    self.decimalClicked = true
                }
            } else {
                self.newVal += num
            }
        }
        return self.newVal
    }
    
    mutating func mathButtonClicked(_ mathOperator: String) -> String{
        if(resultVal.isEmpty){
            self.prevVal = self.newVal
        } else {
            self.prevVal = self.resultVal
        }
        
        self.newVal = ""
        self.decimalClicked = false
        self.mathOperator = mathOperator
        self.resultVal = ""
        return ""
    }
    
    mutating func equalButtonPressed() -> String{
        self.decimalClicked = false
        
        let prevValDbl = Double(self.prevVal)
        let newValDbl = Double(self.newVal)
        switch(self.mathOperator){
        case "+":
            self.resultVal = String(format: "%f", (prevValDbl! + newValDbl!))
        case "-":
            self.resultVal = String(format: "%f", (prevValDbl! - newValDbl!))
        case "x":
            self.resultVal = String(format: "%f", (prevValDbl! * newValDbl!))
        case "/":
            self.resultVal = String(format: "%f", (prevValDbl! / newValDbl!))
        default:
            self.resultVal = self.newVal
        }
        
        self.prevVal = self.resultVal
        return self.resultVal
    }
    
    mutating func clearButtonPressed() -> String{
        self.prevVal = ""
        self.newVal = ""
        self.resultVal = ""
        self.mathOperator = ""
        self.decimalClicked = false
        return "0"
    }
    
    mutating func signButtonClicked(_ currentVal: String) -> String{
        if currentVal == "0" || currentVal == "0.00" {
            return "0"
        } else {
            let resultValDbl: Double = Double(currentVal)!
            let reversedVal: Double = resultValDbl * -1.0
            self.resultVal = String(format: "%.2f", reversedVal)
            return self.resultVal
        }
    }
    
    mutating func percentButtonClicked(_ currentVal: String) -> String{
        if currentVal == "0" || currentVal == "0.00" {
            return "0"
        } else {
            let resultValDbl: Double = Double(currentVal)!
            let percentVal: Double = resultValDbl * 0.01
            self.resultVal = String(format: "%.2f", percentVal)
            return self.resultVal
        }
    }
}
