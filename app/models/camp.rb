class Camp < ActiveRecord::Base
  has_and_belongs_to_many :campers
  validates :name, presence: true, length: { maximum: 50 }
  after_initialize :init

  #here's attempt-to-filter-ver-2

  scope :price, ->(price) {where("price <= ?", price)}
  scope :min_age, ->(min_age) {where("min_age >= ?", min_age)}
  scope :max_age, ->(max_age) {where("max_age <= ?", max_age)}
  scope :namescope, ->(name) {where name: name}
  scope :theme, ->(theme) {where theme: theme}
  scope :weeks, ->(weeks) {where weeks: weeks}
  scope :am, ->(am) {where am: am}

  #end of A-to-F-V-2

  def add_a_camper(camper)
    self.campers << camper
    self.enrolled=self.enrolled+1
  end

  def init
    self.enrolled = 0
  end

  def self.camps
    @camps||= find_camps
  end

  def self.find_camps
    self.find(:all, :conditions => conditions)
  end

  #many of these
  #def self.maximum_price_conditions
  #  ["camps.price<=?", price] unless price.blank?
  #end

  #def self.min_age_conditions
  #  ["camps.min_age>=?", min_age] unless min_age.blank?
  #end

  #def self.max_age_conditions
  #  ["camps.max_age<=?", max_age] unless max_age.blank?
  #end

  #def self.theme_conditions
  #  ["camps.theme==?", theme] unless theme.blank?
  #end

   #def self.weeks_conditions
    #["camps.weeks==?", weeks] unless weeks.blank?
  #end

  #def self.name_conditions
   # ["camps.name==?", name] unless name.blank?
  #end

  #def self.am_conditions
  #  ["camps.am==?", am] unless am.blank?
  #end

  #then join all the conditions together:
  #def self.conditions
  #  [conditions_clauses.join(' AND'), *conditions_options]
  #end

  #def self.conditions_clauses
  #  condition_parts.map{ |condition| condition.first }
  #end

  #def self.conditions_options
  #  conditions_parts.map { |condition| condition[1..-1] }.flatten
  #end

  #def self.conditions_parts
  #  method.grep(/_conditions$/).map { |m| send (m) }.compact
  #end

end
