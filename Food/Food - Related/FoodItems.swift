//
//  FoodItems.swift
//  Food
//
//  Created by mishu on 06.05.2022.
//

import SwiftUI


struct FoodItem:Hashable,Identifiable{
    var id: String
    let name:String
    let menuName:String
    let image:String
    let price:Float
    let menuPrice:Float
    let description:String
    let menuItemsKeys:Array<String>
    let menuItemsValues:Array<Array<String>>
    let category:Category
    
    init(name:String="BigMac",menuName:String="BigMac Menu",image:String="bigmac",price:Float=6.99,menuPrice:Float=15.99,description:String="""
Two slices of grilled beef, seasoned with salt and pepper, Big Mac sauce and Cheddar cheese, crispy salad, onion, sliced pickles, Big Mac bun with sesame.
""",menuItemsKeys:Array<String>=["BigMac","Garniture","Drinks",],menuItemsValues:Array<Array<String>>=[[],["Fries","Dipping Fries"],["Coca-Cola","Fanta","Sprite","Prigat","Water"]],category:Category = .burger){
        
        self.name = name
        self.menuName = menuName
        self.image = image
        self.price = price
        self.menuPrice = menuPrice
        self.description = description
        self.menuItemsKeys = menuItemsKeys
        self.menuItemsValues = menuItemsValues
        self.category = category
        self.id = name
        
        
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

//McDonalds

let bigmac = FoodItem()
let epicBeef = FoodItem(name: "Epic Beef", menuName: "Epic Beef Menu", image: "epicbeef", price: 7.99, menuPrice: 17.99, description: "Two slices of grilled beef, seasoned with salt and pepper, Big Mac sauce and Cheddar cheese, crispy salad, onion, sliced pickles, Big Mac bun with sesame.")
let quarterPounder = FoodItem(name: "Quarter Pounder", menuName: "Quarter Pounder Menu", image: "quarterpounder", price: 6.99, menuPrice: 13.99, description: "We present you a burger you can't resist: a large slice of juicy meat accompanied by two golden slices of Cheddar cheese, pickles, white onions, ketchup and mustard. All carefully placed in a fluffy bun, sprinkled with sesame seeds.")
let bigTasty = FoodItem(name: "BigTasty", menuName: "BigTasty Menu", image: "bigtasty", price: 5.59, menuPrice: 11.59, description: "A slice of minced beef, grilled, seasoned with salt and pepper, Big Tasty sauce and three slices of Emmentaler cheese, Big Tasty crispy salad, fresh tomatoes and onions, Big Tasty bun with sesame.")
let cheeseburger = FoodItem(name: "Cheeseburger", menuName: "Cheeseburger Menu", image: "cheeseburger", price: 2.99, menuPrice: 7.99, description: "A slice of minced beef, seasoned on the grill with a special spice of salt and pepper, a slice of cheddar cheese, sauce, lightly crispy cucumbers and onions, placed in a fresh caramelized bun.")
let freshDeluxe = FoodItem(name: "Fresh Deluxe", menuName: "Fresh Deluxe Menu", image: "freshdeluxe", price: 7.99, menuPrice: 19.99, description: "A slice of minced beef seasoned on the grill with a special spice of salt and pepper, slices of tomato and fresh cucumber, finely chopped white onion, Eisberg salad and McChicken sauce, in a caramelized sesame bun.")
let hamburger = FoodItem(name: "Hamburger", menuName: "Hamburger Menu", image: "hamburger", price: 1.99, menuPrice: 6.99,description:"A slice of minced beef, grilled, seasoned with salt and pepper, mustard and ketchup, onions, slices of pickled cucumber, bun.")
let mcchicken = FoodItem(name: "McChicken", menuName: "McChicken Menu", image: "mcchicken", price: 1.99, menuPrice: 6.99, description: "A slice of chicken in a crispy layer of golden breadcrumbs, accompanied by McPuișor sauce, pickles and bun.")


let mcDonaldsItemsArray = [bigmac,epicBeef,quarterPounder,bigTasty,cheeseburger,freshDeluxe,hamburger,mcchicken]


//Kfc

let crispystrips = FoodItem(name: "Crispy Strips", menuName: "5 Crispy Strips", image: "crispystrips", price: 6.99, menuPrice: 12.99, description: "Chicken breast prepared according to the Hot & Spicy recipe, crispy on the outside and tender on the inside. All time favorites: Crispy Strips.",category:.chicken)
let hotwings = FoodItem(name: "Hot Wings", menuName: "Hot Wings Menu", image: "hotwings", price: 4.99, menuPrice: 12.99, description: "Fericirea vine în doze picante: aripioare de pui, învelite în crustă crocantă.",category:.chicken)
let doubleCrispyBurger = FoodItem(name: "Double Crispy Burger", menuName: "Double Crispy Burger Menu", image: "doublecrispyburger", price: 4.99, menuPrice: 11.99, description: "Double trouble in a burger: Double Crispy Burger. Get 2 Crispy Strips®, Pickled Cucumbers, a Slice of Cheddar Cheese and Burger Sauce")
let doublebooster = FoodItem(name: "Double Booster", menuName: "Double Booster Menu", image: "doublebooster", price: 3.99, menuPrice: 11.49, description: "When you feel like #pebune chicken, but you also have a super craving for something spicy, choose KFC Double Booster. 2 pieces of non-spicy chicken leg, 2 slices of cheddar cheese, pickles, burger sauce and ketchup, all put in a fluffy bun.")


let kfcItemsArray = [crispystrips,hotwings,doubleCrispyBurger,doublebooster]


//Steak House
let beefsteak = FoodItem(name: "Beef Steak", menuName: "Beef STeak Menu", image: "beefsteak", price: 20.99, menuPrice: 35.99, description: """
                         This is just an excellent beef steak that adds juiciness and flavour into steaks, transforming economical steaks from just ok to “wow!”. It injects extra flavour without overpowering the natural flavour of beef, and makes the meat tender.
                         """, menuItemsKeys: ["Beef Steak","Garniture","Souce"], menuItemsValues: [[],["Wedges Fries","Fries","Puree"],["Beer","Red Wine","White Wine"]], category: .beef)

let tagliata = FoodItem(name: "Tagliata", menuName: "Tagliata Menu", image: "tagliata", price: 23.99, menuPrice: 35.99, description: "The sliced beef tagliata with arugula and cherry tomatoes will be perfect to serve for a dinner with friends or whenever your meat-loving guests want to enjoy a succulent and hearty main course.", menuItemsKeys: ["Tagliata","Garniture","Souce"], menuItemsValues: [[],["Wedges Fries","Fries","Puree"],["Beer","Red Wine","White Wine"]], category: .beef)

let grilledsteak = FoodItem(name: "Grilled Steak", menuName: "Grilled Steak Menu", image: "grilledsteak", price: 30.99, menuPrice: 41.99, description: "Thick-cut steaks are rubbed with a generous layer of homemade steak seasoning then grilled and smothered with thick-cut compound herb butter, which is fancy talk for butter mixed with fresh herbs, garlic, and steak seasoning.", menuItemsKeys: ["Tagliata","Garniture","Souce"], menuItemsValues: [[],["Wedges Fries","Fries","Puree"],["Beer","Red Wine","White Wine"]], category: .beef)
let marinadesteak = FoodItem(name: "Marinade Steak", menuName: "Marinade Steak Menu", image: "marinadesteak", price: 35.99, menuPrice: 51.99, description: "World’s Best Steak Marinade adds so much flavor to your juicy steak. It helps to tenderize and infuse the steak with flavor and creates the best steak ever!",menuItemsValues: [[],["Wedges Fries","Fries","Puree"],["Beer","Red Wine","White Wine"]], category: .beef)

let steakhouseItemsArray = [beefsteak,tagliata,grilledsteak,marinadesteak]


//Tsao Sushi

let makisushi = FoodItem(name: "Maki-Sushi", menuName: "Maki-Sushi Menu", image: "makisushi", price: 9.99, menuPrice: 15.99, description: "Sushi Maki is a classic variant of sushi in Japanese cuisine, easily recognizable, made of rice and other ingredients rolled inside a sheet of seaweed called Nori.", menuItemsKeys: ["Maki-Sushi"], menuItemsValues: [[]], category: .sushi)

let amaericansushi = FoodItem(name: "American Sushi", menuName: "American Sushi Menu", image: "americansushi", price: 10.99, menuPrice: 15.99, description: "Sushi Maki is a classic variant of sushi in Japanese cuisine, easily recognizable, made of rice and other ingredients rolled inside a sheet of seaweed called Nori.", menuItemsKeys: ["American Sushi"], menuItemsValues: [[]], category: .sushi)

let tsaospeciality = FoodItem(name: "Tsao Speciality", menuName: "Tsao Speciality", image: "tsaospeciality", price: 9.99, menuPrice: 15.99, description: "Sushi Maki is a classic variant of sushi in Japanese cuisine, easily recognizable, made of rice and other ingredients rolled inside a sheet of seaweed called Nori.", menuItemsKeys: ["Tsao Speciality"], menuItemsValues: [[]], category: .sushi)


let tsaoItemsArray = [makisushi,amaericansushi,tsaospeciality]

//Old Cuisine
let greeksalad = FoodItem(name: "Greek Salad", menuName: "Greek Salad Menu", image: "greeksalad", price: 4.99, menuPrice: 9.99, description: "A traditional Greek salad consists of sliced cucumbers, tomatoes, green bell pepper, red onion, olives, and feta cheese. This classic combination is delicious, so I stick to it, just adding a handful of mint leaves for a fresh finishing touch. My olives of choice are Kalamata olives.", menuItemsKeys: ["Greek Salad","Sauce"], menuItemsValues: [[],["Balsamic","Oil","Special"]], category: .salad)
let bulgariansalad = FoodItem(name: "Bulgarian Salad", menuName: "Bulgarian Salad Menu", image: "bulgariansalad", price: 5.99, menuPrice: 10.99, description: "A traditional Bulgarian salad consists of sliced cucumbers, tomatoes, green bell pepper, red onion, olives, and feta cheese. This classic combination is delicious, so I stick to it, just adding a handful of mint leaves for a fresh finishing touch. My olives of choice are Kalamata olives.", menuItemsKeys: ["Bulgarian Salad","Sauce"], menuItemsValues: [[],["Balsamic","Oil","Special"]], category: .salad)
let baclava = FoodItem(name: "Baclava", menuName: "Baclava Menu", image: "baclava", price: 3.59, menuPrice: 6.99, description: "Baclava is a Turkish dessert, the delicacy being one of the most famous cakes of the Orient.", menuItemsKeys: ["Baclava"], menuItemsValues: [[]], category: .desertes)
let pancakes = FoodItem(name: "Pancakes", menuName: "Pancakes", image: "pancakes", price: 9.99, menuPrice: 10.99, description: "A pancake is a flat cake, often thin and round, made from a starch-based dough that may contain eggs, milk and butter and cooked on a hot surface, such as a grill or frying pan, often fried in oil or butter. It's a kind of dough bread.", menuItemsKeys: ["Pancakes","Topping"], menuItemsValues: [[],["Chocolate","Rasberry","Honey","Nuts"]], category: .desertes)

let oldcuisineItemsArray = [greeksalad,bulgariansalad,baclava,pancakes]


//Ristorante
let pasta = FoodItem(name: "Pasta", menuName: "Pasta Menu", image: "boiledpasta", price: 5.99, menuPrice: 10.99, description: "Pastas are divided into two broad categories: dried (pasta secca) and fresh (pasta fresca). Most dried pasta is produced commercially via an extrusion process, although it can be produced at home. Fresh pasta is traditionally produced by hand, sometimes with the aid of simple machines. Fresh pastas available in grocery stores are produced commercially by large-scale machines.", menuItemsKeys: ["Pasta","Sauce"], menuItemsValues: [[],["Tomatoes","Italian","Garlic","None"]], category: .pasta)
let carbonara = FoodItem(name: "Carbonara", menuName: "Carbonara Menu", image: "carbonara", price: 12.99, menuPrice: 16.99, description: "Carbonara is a pasta dish originally from Rome, Italy. It is made with eggs, hard cheese, pork and black pepper. It got its current name carbonara in the middle of the 20th century. The cheese used for this dish is usually Pecorino Romano, Parmesan or a combination of the two.", menuItemsKeys: ["Carbonara","Sauce"], menuItemsValues: [[],["Tomatoes","Italian","Garlic","None"]], category: .pasta)
let capriciosa = FoodItem(name: "Capriciosa", menuName: "Capriciosa Menu", image: "capriciosa", price: 11.59, menuPrice: 17.99, description: "Pizza capricciosa is a style of pizza in Italian cuisine made with mozzarella cheese, Italian ham, mushrooms, artichokes and tomatoes. The types of edible mushrooms used may include creams and more.", menuItemsKeys: ["Capriciosa","Sauce"], menuItemsValues: [[],["Spicy","Garlic","Ketchup"]], category:.pizza)
let diavola = FoodItem(name: "Diavola", menuName: "Diavola Menu", image: "diavola", price: 11.59, menuPrice: 17.99, description: "Pizza diavola is a style of pizza in Italian cuisine made with mozzarella cheese, Italian ham, mushrooms, artichokes and tomatoes. The types of edible mushrooms used may include creams and more.", menuItemsKeys: ["Diavola","Sauce"], menuItemsValues: [[],["Spicy","Garlic","Ketchup"]], category:.pizza)


let ristoranteItemsArray = [pasta,carbonara,capriciosa,diavola]

let allFood = mcDonaldsItemsArray + kfcItemsArray + steakhouseItemsArray + tsaoItemsArray + oldcuisineItemsArray + ristoranteItemsArray
