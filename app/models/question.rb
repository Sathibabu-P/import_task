class Question < ApplicationRecord

  validates :question, presence: true

  belongs_to :mapping
  belongs_to :role

  self.inheritance_column = :_type_disabled #to disable STI and access type column

  scope :order_by, ->(column = :id) { reorder(column => :asc) } #dynamic column order
  scope :order_by_assoc, ->(order) { reorder(order) }

  
  def role_id
    role.title
  end
  
  def mapping_id
    mapping.title
  end

end
