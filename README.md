Manitoba Bikes
A Ruby on Rails Fullstack ECommerce Project.

One of the requirements to complete my Fullstack Web Development course is to create an eCommerce Website using Ruby on Rails. I took this opportunity to use my passion in cycling to create this website.

Summary:

- Bicycle data were scraped from Bikes and Beyond web site
- PostgreSQL as the database
- Bootstrap for UI
- Active Admin for admin stuff
- Active storage as file storage
- Stripe to simulate test payment

=========================================================
Initial setup


1.  Create new project using postgresql
    rails new manitoba_bikes --database=postgresql

2.  To install the bundles from GemFile

    gem 'activeadmin' # Admin dashboard
    gem 'devise' # Authentication library
    gem 'sassc'

    bundle install

3.  Install active admin
    rails g active_admin:install
    rails db:migrate # database must be created first
    rails db:seed # update seeds.rb for the email and password first
    rails server

4.  Generate models
    rails generate model Bike_Shipment bike_id:integer shipment_id:integer quantity:integer
    rails generate model Shipment shipping_number:string date:date
    rails generate model Brand name:string
    rails generate model Bike brand_id:integer model:string category_id:integer color:string price:decimal description:text
    rails generate model Category name:string
    rails generate model Bike_Order quantity:integer unit_price:decimal tax_rate:decimal
    rails generate model Order customer_id:integer date:date
    rails generate model Cart customer_id:integer
    rails generate model Bike_Cart bike_id:integer cart_id:integer
    rails generate model Customer first_name:string lastname:string email:string password:string birthday:date address:string province_id:integer
    rails generate model Customer first_name:string lastname:string email:string password:string birthday:date address:string province_id:integer
    rails generate model Province name:string tax_type:string pst:decimal gst:decimal hst:decimal

5.  Active Storage
    Add this to gemfile
    gem "image_processing", ">= 1.2"

    Install vips
    sudo apt install libvips
