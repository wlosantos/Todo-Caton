class Task < ApplicationRecord

  belongs_to :parent, class_name: 'Task', optional: true
  has_many :sub_tasks, class_name: 'Task', foreign_key: :parent_id, dependent: :destroy

  scope :only_parents, -> { where(parent_id: nil)}


  validates :description, presence: { message: 'é um campo obrigatório!!!' }
  validates :done, inclusion: { in: [true, false] }

  scope :orderPrazo, -> { order(:due_date, :description)}

  def parent?
    parent_id.nil?
  end

  def sub_task?
    !parent?
  end

  def symbol
    case status
    when 'pending' then '»'
    when 'done'    then '√'
    when 'expired' then 'x'
    end
  end

  def cssStyle
    case status
    when 'pending' then 'has-text-info'
    when 'done'    then 'has-text-success'
    when 'expired' then 'has-text-danger'
    end
  end

  private

  def status
    return 'done' if done?
    due_date.past? ? 'expired' : 'pending'
  end

end
