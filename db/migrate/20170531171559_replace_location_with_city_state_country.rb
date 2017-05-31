class ReplaceLocationWithCityStateCountry < ActiveRecord::Migration[5.0]
  def change
    remove_column :mentors, :location, :string
    add_column :mentors, :city, :string
    add_column :mentors, :state, :string
    add_column :mentors, :country, :string
  end
end
