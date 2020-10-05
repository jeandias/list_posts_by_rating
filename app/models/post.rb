class Post < ApplicationRecord
  after_save :update_rate

  private

  def update_rate
    total = up + down
    percent = up.to_f / total * 100
    update_column(:rate, percent)
  end
end
