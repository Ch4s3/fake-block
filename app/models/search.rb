class Search < ActiveRecord::Base

  def self.terms_for(prefix)
    suggestions = where("term like ?", "#{prefix}_%")
    suggestions.order("popularity desc").limit(10).pluck(:term)
  end
  
  def self.index_user user
    index_term(user.name)
    user.name.split.each { |t| index_term(t) }
  end

  def self.index_users
    User.find_each do |user|
      index_term(user.name)
      user.name.split.each { |t| index_term(t) }
    end
  end

  def self.index_term(term)
    where(term: term.downcase).first_or_initialize.tap do |suggestion|
      suggestion.increment! :popularity
    end
  end
end
