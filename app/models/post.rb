class Post < ActiveRecord::Base
    belongs_to :author
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbait?


def clickbait?
    criteria = [
        /Won't Believe/i,
        /Secret/i,
        /Top [0-9]*/i,
        /Guess/i
      ]

      if criteria.none?{|phrase|phrase.match title}
        errors.add(:title, "NOT clickbaity")

end
end
end
