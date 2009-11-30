class Post < ActiveRecord::Base
  def self.find_recent(options = {:limit => 2})
    self.recent.find :all, options
  end
  
  def self.find_popular(options = {} )
    options.reverse_merge! :limit => 5, :since => 7.days
    
    self.popular.since(options[:since]).find :all, :limit => options[:limit]
  end

  def self.find_featured(options = {:limit => 5})
    self.recent.by_featured_writers.find(:all, :limit => options[:limit] )    
  end

  def self.find_most_commented(limit = 5, since = 7.days.ago)
    Post.find(:all, 
      :select => 'posts.*, count(*) as comments_count',
      :joins => "LEFT JOIN comments ON comments.commentable_id = posts.id",
      :conditions => ['comments.commentable_type = ? AND posts.published_at > ?', 'Post', since],
#      :group => 'comments.commentable_id',      
      :group => self.columns.map{|column| self.table_name + "." + column.name}.join(","),
      :order => 'comments_count DESC',
      :limit => limit
      )
  end
      
end
