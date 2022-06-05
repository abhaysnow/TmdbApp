//
//  ViewController.swift
//  VoiroMoviea
//
//  Created by SNOW on 04/06/22.
//

import UIKit
import SDWebImage
class ViewController: UIViewController {
    let viewModel = MoviesVM()
    //MARK :- Outlets
    //----------------------------------------------
    @IBOutlet weak var moviesTblview: UITableView!
    //MARK :- ViewlifeCycles
    //----------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        hitMoviesList()
        // Do any additional setup after loading the view.
    }


}
//MARK :- tableViewDelegates
//----------------------------------------------
extension ViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(viewModel.moviesList?.count ?? 0)
        return viewModel.moviesList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTblview.dequeueReusableCell(withIdentifier: "cell") as! MoviesListTableViewCell
        cell.posterImg.sd_setImage(with: URL(string: APIConstants.BASE_IMAGE_URL + (viewModel.moviesList?[indexPath.row].posterPath ?? "") ) , placeholderImage: #imageLiteral(resourceName: "default-placeholder") , completed: nil)
        cell.titleTxt.text = viewModel.moviesList?[indexPath.row].title
        cell.ratingTxt.text = "\(viewModel.moviesList?[indexPath.row].voteAverage ?? 0.0)"
        return cell
    }
    
    
}
//MARK :- Apihit
//----------------------------------------------
extension ViewController {
    func hitMoviesList(){
        viewModel.moviesListApi { success, msg in
            if success{
                DispatchQueue.main.async {
                    self.moviesTblview.reloadData()
                }
                
            }else{
                print(msg)
            }
        }
    }
}
