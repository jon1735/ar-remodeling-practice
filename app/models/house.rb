class House < ActiveRecord::Base
  has_many :projects
  has_many :owners, through: :projects

  def self.oldest_house
    House.all.order(:year_built).first
  end
  # to test, set all_houses = House.all, then call the variable to the method... all_houses.oldest_house
  
  def self.get_houses_with_solar
    House.where(solar: true)
  end

  def install_solar
    solar ? puts("This house already has solar installed") : update(solar: true)
  end

  def schedule_project(owner, price)
    Project.create(price: price, owner: owner, house: self)
  end

  def total_remodeling_cost
    projects.sum(:price)
  end
end

# to test associations, type out stuff like: Project.first.house, Project.all, Owner.first.house, Project.first.owner
