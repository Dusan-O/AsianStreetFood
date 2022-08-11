//
//  FoodListController.swift
//  AsianStreetFood
//
//  Created by Dusan Orescanin on 11/08/2022.
//

import UIKit

class FoodListController: UIViewController {
    
    @IBOutlet var myImageViews: [UIImageView]!
    
    var foods: [Food] = [
    Food(name: "Nasi Goreng", desc: "Le Nasi Goreng est un plat indonésien qu’on retrouve un peu partout sur l’archipel. Ce « riz frit » est un classique et peut être agrémenté de viande (poulet notamment) en plus des nombreux légumes qui le composent. A Bali, vous pourrez notamment le manger accompagné de chips de crevettes.", country: "Indonésie", image: "nasi"),
    Food(name: "Yakitori", desc: "Le yakitori c’est avant tout une ambiance : un bar, un chef japonais et une immense liste de brochettes, de la joue de porc à la pate de poulet. Pour les moins aventureux, les morceaux plus classiques sont évidemment au menu, et les brochettes s’offrent à vous par deux. Un délice un peu trop transformé en France par les fameux « boeuf fromage », bien loin de ce qu’on trouve au Japon.", country: "Japon", image: "yakitori"),
    Food(name: "Dim Sum", desc: "Véritable classique de la cuisine chinoise (d’origine cantonaise), les Dim Sum sont des bouchées pouvant être cuisinées à la vapeur, au four, en friture, etc. On trouve de tout à l’intérieur : du porc, des crevettes, du poulet, des légumes. Les Dim Sum sont un met privilégiés lors de la cérmonie du thé (Yum Cha).", country: "Chine", image: "dim"),
    Food(name: "Dal Bhat", desc: "D’où les népalais tirent leur force ? du Dhal Bat bien sur ! Ce curry de lentille servi avec du riz blanc est le plat officiel du Nepal et nourrit les montagnards prêt à arpenter l’Everest. A noter que dans tous les restaurants, c’est le seul plat à être systématiquement reservi (il est même parfois à volonté). On ne peut que s’incliner devant le Dhal Bat Power !", country: "Népal", image: "dal"),
    Food(name: "Lok Lak", desc: "Le Lok Lak cambodgien apporte une touche aigre douce au boeuf. En résulte un plat savoureux qui est désormais un des grands classiques de la cuisine cambodgienne : on le retrouve partout !", country: "Cambodge", image: "lok"),
    Food(name: "Tandoori", desc: "La tradition culinaire du nord de l’Inde n’est plus à démontrer. La cuisine pendjab a de nombreux atouts dont le tandoor, ce four traditionnel qui permet de tout cuire (ou presque). Aujourd’hui, on les connait surtout pour les naans (ces pains avec ou sans fromage) et le délicieux poulet tandoori. Mariné au yahourt puis cuit dans ce four, le poulet tandoori arbore une jolie couleur rouge et est tendre et gouteux.", country: "Inde", image: "tan"),
    Food(name: "Mango Rice", desc: "Ce riz gluant (khao niao) est traditionnel des cuisines thailandaises et laotiennes. Cuit à l’étuvée avec du lait de coco, il prend toute sa dimension avec une mangue sucrée et mure. Certains préfèrent le durian, mais je garde une préférence pour la mangue ! On lui laisse une place sur le podium, notamment parce que les desserts sont pas forcement toujours fabuleux.", country: "Laos", image: "mango"),
    Food(name: "Pad Thai", desc: "Cantoner le pad thai à la street food ne serait pas lui rendre hommage. Le plat thailandais le plus populaire s’apprécie de divers façons et les nombreuses epices, petits légumes et condiments lui permettent d’être unique, selon chaque cuisine. On lui rajoute parfois des crevettes ou du poulet, mais la version végétarienne est une merveille de raffinements.", country: "Thailande", image: "pad"),
    Food(name: "Sushi", desc: "On ne peut qu’offrir la première place de ce classement au sushi. Bonheur minimaliste, explosion de saveur, il s’adapte aux différents poissons et légumes (voire viande ou oeuf) pour offrir une fraicheur exemplaire.", country: "Japon", image: "sushi"),
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getRoundedImages()
    }
    
    func setupViews() {
        for index in 0..<myImageViews.count {
            if let imageView = myImageViews.first(where: {$0.tag == index}) {
                let imageString = foods[index].image
                let image = UIImage(named: imageString)
                imageView.image = image
                imageView.contentMode = .scaleAspectFill
                imageView.isUserInteractionEnabled = true
            }
            //let imageView = myImageViews[index]

        }
    }
    
    func getRoundedImages() {
        myImageViews.forEach { imageView in
            imageView.layer.cornerRadius = imageView.frame.height / 2
            imageView.layer.borderColor = UIColor.label.cgColor
            imageView.layer.borderWidth = 2
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if let imageView = touch.view as? UIImageView {
                let food = foods[imageView.tag]
                performSegue(withIdentifier: "Detail", sender: food)
            }
        }
    }
            
            override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "Detail" {
                    if let next = segue.destination as? DetailController {
                    next.food = sender as? Food
                }
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


