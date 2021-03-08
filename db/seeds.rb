User.destroy_all
Item.destroy_all
Purchase.destroy_all

angelo = User.create(name: "angelo", password: "123")

fancy_pants = Item.create(name: "Fancy Pants", price: 50)
biznas_socks = Item.create(name: "Biznas Socks", price: 15)
fedora = Item.create(name: "Fedora", price: 100)

Purchase.create(user_id: angelo.id, item_id: fancy_pants.id)