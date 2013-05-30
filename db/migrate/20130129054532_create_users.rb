class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :address1
      t.text :address2
      t.string :zipcode
      t.string :email
      t.string :password
      t.date :dob
      #t.string :mstatus
      t.integer :mstatus  ,:limit => 1
      #t.enum :mstatus ,:limit => [:single, :married, :divorced,:widowed] ,:default => :single

      

      t.timestamps
    end
  end
end
