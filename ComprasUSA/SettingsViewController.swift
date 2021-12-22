
import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tfDolar: UITextField!
    @IBOutlet weak var tfIOF: UITextField!
    @IBOutlet weak var tfSatesTaxes: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfDolar.text = tc.getFormatedValue(of: tc.dolar, withCurrency: "")
        tfIOF.text = tc.getFormatedValue(of: tc.iof, withCurrency: "")
        tfSatesTaxes.text = tc.getFormatedValue(of: tc.stateTax, withCurrency: "")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func setValues(){
        tc.dolar = tc.convertDouble(tfDolar.text!)
        tc.iof = tc.convertDouble(tfIOF.text!)
        tc.stateTax = tc.convertDouble(tfSatesTaxes.text!)
    }
    

}


extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField){
        setValues()
    }
}
