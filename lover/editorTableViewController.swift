//
//  editorTableViewController.swift
//  lover
//
//  Created by Pin yu Huang on 2021/3/19.
//

import UIKit

class editorTableViewController: UITableViewController {

    //因為修改資料有前一頁的內容或是新增情人時是nil
    var lover:Lover?
    

    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var innerBeautySwitch: UISwitch!
    @IBOutlet weak var starTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    
    }

    // MARK: - Table view data source

   

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
   //欄位不為空白時回傳ture
   if nameTextField.text?.isEmpty == false,
      starTextField.text?.isEmpty == false,
      weightTextField.text?.isEmpty == false{
   return true
}  else {
   let alertController = UIAlertController(title: "emptyError", message: "inputInformation", preferredStyle: .alert)
   //使用者要按這個"OK"button之後再填寫資料
   alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
   present(alertController, animated: true, completion: nil)
   return false
}
}



//要把填寫得資料回傳到前一頁 使用preapare 再按done(unwindSegue）前先觸發prepare
func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 
let name = nameTextField.text ?? ""
let star = starTextField.text ?? ""
 let weight = Double(weightTextField.text!) ?? 0
 let innerBeauty = innerBeautySwitch.isOn
    
lover =  Lover(name: name, star: star, weight: weight, innerBeauty:Bool)
  
}
    // In a storyboard-based application, you will often want to do a little preparation before navigation
   
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    

//（在overrideViewDidLoad外位置）
//三個欄位沒有填寫完全 使用shouldPerformSegue跳出警示
