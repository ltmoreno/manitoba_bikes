require "csv"
# Delete tables before seeding
AdminUser.delete_all
Brand.destroy_all
Category.destroy_all
Bike.destroy_all
Province.destroy_all

AdminUser.create!(email: ENV['admin_email'], password: ENV['admin_password'], password_confirmation: ENV['admin_password']) if Rails.env.development?

### Scrape Bikes ###
# open csv file
bikes_and_beyond_file = Rails.root.join("db/BikesAndBeyond.csv")
puts "Loading Brands, Categories and Bikes from CSV file: BikesAndBeyond.csv"
# read the file
bikes_and_beyond_data = File.read(bikes_and_beyond_file)
bikes_and_beyond = CSV.parse(bikes_and_beyond_data, headers: true, encoding: "utf-8")

bikes_and_beyond.each do |b|
  brand = Brand.find_or_create_by(
    name: b["brand"]
  )

  category = Category.find_or_create_by(
    name: b["category"]
  )

  if brand&.valid? && category&.valid?
    bike = brand.bikes.create(
      model: b["model"],
      category: category,
      color: b["color"],
      price: b["price"],
      description: b["description"]
    )

    downloaded_image = URI.open(b["photo-src"])
    bike.photo.attach(io: downloaded_image, filename: "#{[brand.name, bike.id].join('-')}.jpg")

    unless bike&.valid?
      puts "Invalid bike - #{bike.errors.full_messages}"
    end

  else
    unless brand&.valid?
      puts "#{b["brand"]}  - #{brand.errors.full_messages}"
    end

    unless category&.valid?
      puts "#{b["category"]}  - #{category.errors.full_messages}"
    end
  end
end

### Scrape Provinces ###
canada_provincial_taxes_file = Rails.root.join("db/CanadaProvincialTaxes.csv")
puts "Loading Provinces from CSV file: CanadaProvincialTaxes.csv"
# read the file
canada_provincial_taxes_data = File.read(canada_provincial_taxes_file)
canada_provincial_taxes = CSV.parse(canada_provincial_taxes_data, headers: true, encoding: "utf-8")

canada_provincial_taxes.each do |p|
  province = Province.create(
    name: p["province"],
    tax_type: p["type"],
    pst: p["pst"],
    gst: p["gst"],
    hst: p["hst"]
  )
end
