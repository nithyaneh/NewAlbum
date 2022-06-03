//
//  ViewController.swift
//  Album
//
//  Created by apple on 6/2/22.
//  Copyright © 2022 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var arrAlbumVM = [AlbumViewModel]()
       
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "albumCell")
        self.getData()
       // navigationController?.navigationBar.t
    }
    
    func getData(){
        Service.shared.urlString = "https://itunes.apple.com/search?media=music&term=bollywood"
        Service.shared.getAllAlbumData{ (albums, error) in
            if(error==nil){
                self.arrAlbumVM = albums?.map({ return AlbumViewModel(album: $0) }) ?? []
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }

        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrAlbumVM.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath) as! CustomTableViewCell
        let MVM = arrAlbumVM[indexPath.row]
        cell.albumViewModel = MVM
        return cell
    }
    
}

