class Task < ApplicationRecord

  validates :description, presence: { message: 'é um campo obrigatório!!!' }
  validates :done, inclusion: { in: [true, false] }

  scope :orderPrazo, -> { order(:due_date, :description)}

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
