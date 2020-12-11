class Task < ApplicationRecord

  validates :description, presence: { message: 'é um campo obrigatório!!!' }
  validates :done, inclusion: { in: [true, false] }

end
