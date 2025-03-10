
List categories_image=[
  {"imagename":"assets/images/shoes.jpg",},
  {"imagename":"assets/images/women-shoes (1).jpg"},
  {"imagename":"assets/images/electricity2.jpg"},
  {"imagename":"assets/images/hobbies.jpg"},
];
List categories_text=[
  {"text":"Men"},
  {"text":"Women"},
  {"text":"Electrical"},
  {"text":"Hobbies"}
];

List best_selling=[
  {"image": ["assets/images/headphone.jpg", "assets/images/headphone2.webp"],
    "title":"Headphone",
    "description":"Bluetooth headphone",
    "price":"1000\$",
    "size":"no",
    "color":["red","grey"],
  },
  {"image":["assets/images/smartwatch.jpg", ],
    "title":"Smart Watch",
    "description":"smart watch isolated",
    "price":"1500\$",
    "size":"no",
    "color":["blue"]
  },
  {"image":["assets/images/shoes3.webp"],
    "title":"Shoes Running",
    "description":"ADIDAS Running shoes",
    "price":"100\$",
    "size":"yes",
    "color":["blue"]
  },
  {"image":["assets/images/high_heels3.jpg",],
    "title":"Women Heels",
    "description":"Classical-Ecru",
    "price":"1500\$",
    "color": ["ecru"],
    "size":"yes"
  },


];

Map<String, List<Map<String, dynamic>>> categoryItems = {
  "Men": [
    {"title": "Shoes Running", "description": "ADIDAS Runfalcon 5 W Running shoes", "price": "200\$", "image": ["assets/images/shoes1.webp","assets/images/shoes2.webp"],"color":["black","white"],"size":"yes"},
    {"title": "Shoes Running", "description": "ADIDAS Running shoes Response Runner", "price": "220\$", "image": ["assets/images/shoes3.webp"],"color": ["blue"],"size":"yes"},
    {"title": "Sneakers", "description": "ADIDAS GRAND COURT BASE 2.0 Shoes", "price": "100\$", "image": ["assets/images/sneaker.jpg"],"color": ["white"],"size":"yes"},
    {"title": "Sneakers", "description": "Airwalk shoes", "price": "120\$", "image": ["assets/images/sneaker1.webp"],"color": ["black"],"size":"yes"},
  ],
  "Women": [
    {"title": "Women Heels", "description": "Women`s Leather Block Heeled Pump", "price": "800\$", "image": ["assets/images/high_heels1.webp"],"color": ["black"],"size":"yes"},
    {"title": "High Heels", "description": "Christian Louboutin", "price": "1200\$", "image": ["assets/images/high_heels.webp"],"color": ["black"],"size":"yes"},
    {"title": "Women Heels", "description": "Classical-Ecru", "price": "1500\$", "image": ["assets/images/high_heels3.jpg"],"color": ["ecru"],"size":"yes"},
    {"title": "Women Shoes", "description": "adidas Women's Duramo Rc Shoes", "price": "600\$", "image": ["assets/images/women-shoes 1.jpg","assets/images/women-shoes 2.jpg"],"color": ["black","pink"],"size":"yes"},
  ],
  "Electrical": [
    {"title": "Headphone", "description": "Bluetooth headphone", "price": "1000\$", "image": ["assets/images/headphone.jpg","assets/images/headphone2.webp"],"color": ["red","grey"]},
    {"title": "Smart Watch", "description": "smart watch isolated", "price": "1500\$", "image": ["assets/images/smartwatch.jpg"],"color": ["blue"]},
  ],
  "Hobbies": [
    {"title": "Fiction Books", "description": "best 10 fiction books", "price": "80\$", "image": ["assets/images/books.jpg"],},
    {"title": "Piano", "description": "KAWAI Mini Grand Piano ", "price": "250\$", "image": ["assets/images/piano.jpg"],"color":["black"]},
    {"title": "Sherlock Holmes Novel", "description": "The Complete Novel of Sherlock Holmes", "price": "20\$", "image": ["assets/images/novel.jpg"],},
    {"title": "Losing the Plot Novel", "description": "Film and Feeling in the Modern Novel", "price": "15\$", "image": ["assets/images/novel1.jpg"],},
  ],
};
