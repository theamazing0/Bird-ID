//
//  ScrollViewController.swift
//  Bird ID
//
//  Created by Samvid Konchada on 8/29/20.
//  Copyright © 2020 Samvid. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController {

    var myBird = ""
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       var dictionary = [
        "American Crow" : "The American crow is a large passerine bird species of the family Corvidae. It is a common bird found throughout much of North America. American crows are the New World counterpart to the carrion crow and the hooded crow.",
        "Downy Woodpecker" : "The downy woodpecker is a species of woodpecker, the smallest in North America.",
        "Northern Cardinal" : "The northern cardinal is a bird in the genus Cardinalis; it is also known colloquially as the redbird, common cardinal or just cardinal. It can be found in southeastern Canada, through the eastern United States from Maine to Minnesota to Texas, and south through Mexico, Belize, and Guatemala.",
        "American Goldfinch" : "The American goldfinch is a small North American bird in the finch family. It is migratory, ranging from mid-Alberta to North Carolina during the breeding season, and from just south of the Canada–United States border to Mexico during the winter.",
        "European Starling" : "The common starling, also known as the European starling in the United States or simply the starling in the British Isles, is a medium-sized passerine bird in the starling family, Sturnidae. It is about 20 cm long and has glossy black plumage with a metallic sheen, which is speckled with white at some times of year.",
        "Red-bellied Woodpecker" : "The red-bellied woodpecker is a medium-sized woodpecker of the family Picidae. It breeds mainly in the eastern United States, ranging as far south as Florida and as far north as Canada.",
        "Black-Capped Chickadee" : "The black-capped chickadee is a small, nonmigratory, North American songbird that lives in deciduous and mixed forests. It is a passerine bird in the tit family Paridae. It is the state bird of Massachusetts and of Maine in the United States, and the provincial bird of New Brunswick in Canada.",
        "House Finch" : "The house finch is a bird in the finch family Fringillidae. It is native to western North America and has been introduced to the eastern half of the continent and Hawaii. ",
        "Tufted Titmouse" : "The tufted titmouse is a small songbird from North America, a species in the tit and chickadee family. The black-crested titmouse, found from central and southern Texas southward, was included as a subspecies, but now is considered a separate species.",
        "Blue Jay" : "The blue jay is a passerine bird in the family Corvidae, native to eastern North America. It resides through most of the eastern and central United States, although western populations may be migratory.",
        "House Sparrow" : "The house sparrow is a bird of the sparrow family Passeridae, found in most parts of the world. It is a small bird that has a typical length of 16 cm and a mass of 24–39.5 g. Females and young birds are coloured pale brown and grey, and males have brighter black, white, and brown markings.",
        "White-breasted Nuthatch" : "The white-breasted nuthatch is a small songbird of the nuthatch family common across much of temperate North America. It is stocky, with a large head, short tail, powerful bill, and strong feet. It has a black cap, white face, chest, and flanks, blue-gray upperparts, and a chestnut lower belly.",
        "Dark Eyed Junco" : "The dark-eyed junco is a species of junco, a group of small, grayish American sparrows. This bird is common across much of temperate North America and in summer ranges far into the Arctic. It is a very variable species, much like the related fox sparrow, and its systematics are still not completely untangled.",
        "Mourning Dove  " : "The mourning dove is a member of the dove family, Columbidae. The bird is also known as the American mourning dove, the rain dove, and colloquially as the turtle dove, and was once known as the Carolina pigeon and Carolina turtledove. It is one of the most abundant and widespread of all North American birds. "
        ]
        
        label.text = dictionary[myBird]
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
