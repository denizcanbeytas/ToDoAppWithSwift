//
//  YapılacaklarViewController.swift
//  HomeWork7
//
//  Created by Deniz on 19.03.2022.
//

import UIKit

class YapilacaklarViewController: UIViewController {

    @IBOutlet weak var yapilacaklarTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var toDoList = [Yapilacaklar]()
    
    var anasayfaPresenterNesnesi:ViewToPresenterAnasayfaProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        yapilacaklarTableView.delegate = self
        yapilacaklarTableView.dataSource = self
        
        
        veritabaniKopyala()
        
        YapilacaklarRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // anasayfa ilk açıldığında ve geri döndüğünde
        anasayfaPresenterNesnesi?.toDolarıYukle()
    }

    @IBAction func addToDoBtn(_ sender: Any) {
        //performSegue(withIdentifier: "kayitGecVC", sender: nil)
        
    }
    @IBAction func addClicked(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detayGecisVC" {
            if let veri = sender as? Yapilacaklar {
                let gidilecekVC = segue.destination as! YapilacakIsDetayViewController
                gidilecekVC.yapilacaklar = veri
            }
        }
    }
    
    func veritabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "yapilacaklar", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapilacaklar.sqlite")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: kopyalanacakYer.path){
            print("Veri tabani zaten var.")
        }else {
            do{
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }catch{}
        }
    }
}

extension YapilacaklarViewController : PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(toDoList: Array<Yapilacaklar>) {
        self.toDoList = toDoList
        self.yapilacaklarTableView.reloadData()
    }
    
    
}

extension YapilacaklarViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        anasayfaPresenterNesnesi?.ara(aramaKelimesi: searchText) // searchText func içinde geldi
       
    }
}
extension YapilacaklarViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let toDo = toDoList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "yapilacaklarHucre", for: indexPath) as! YapilacaklarTableViewCell
        cell.tableViewCellLabel.text = "\(toDo.yapilacak_is!)"
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = toDoList[indexPath.row]
        performSegue(withIdentifier: "detayGecisVC", sender: toDo)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Sil") {_,_,_ in
            let toDo = self.toDoList[indexPath.row]
            
            let alert = UIAlertController(title: "silme işlemi", message: "\(toDo.yapilacak_is!) silinsin mi ?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel){action in}
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive) {action in
                self.anasayfaPresenterNesnesi?.sil(yapilacak_id: toDo.yapilacak_id!)
            }
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
            
            
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}



