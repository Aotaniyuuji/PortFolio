class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :title, presence: true, length: {maximum: 20}
  validates :comment, presence: true, length: {maximum: 200}
  validates :star, presence: true
  
  def avg_score
    unless self.comment.empty?
      comment.average(:rate_id).round(1)
    else
      0.0
    end
  end

 def avg_score_percentage
   unless self.comment.empty?
     comment.average(:rate_id).round(1).to_f*100/5
   else
     0.0
   end
 end
end
