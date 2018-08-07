Product.destroy_all
ActiveRecord::Base.connection.execute("ALTER SEQUENCE products_id_seq RESTART WITH 1")

Product.create!(title: 'Ruby Book', description: 'Learn Ruby programming', price: 12.99, published: true)
Product.create!(title: 'jQuery Book', description: 'Learn jQuery', price: 11.99, published: true)
Product.create!(title: 'SASS Book', description: 'Learn SASS', price: 19.99, published: true)
