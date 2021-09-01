class Project < ActiveRecord::Base
  belongs_to :owner
  belongs_to :house

  def self.total_cost
    sum(:price)
  end

  def install_solar_and_update_price_by500
    house.solar ? puts("You're good to go.") : 
    update(solar: true, price: price + 500)
    puts("Solar added to this project. The new Price is #{price}")
  end
end
