require 'digest/sha1'

class User < ActiveRecord::Base
  
  def self.find_by_activity(options = {})
    options.reverse_merge! :limit => 10, :require_avatar => true, :since => 7.days.ago   
    #Activity.since.find(:all,:select => Activity.columns.map{|column| Activity.table_name + "." + column.name}.join(",")+', count(*) as count',:group => Activity.columns.map{|column| Activity.table_name + "." + column.name}.join(","),:order => 'count DESC',:joins => "LEFT JOIN users ON users.id = activities.user_id" )
    #Activity.since(7.days.ago).find(:all,:select => 'activities.user_id, count(*) as count',:group => 'activities.user_id',:order => 'count DESC',:joins => "LEFT JOIN users ON users.id = activities.user_id" )
    activities = Activity.since(options[:since]).find(:all, 
      :select => 'activities.user_id, count(*) as count', 
      :group => 'activities.user_id', 
      :conditions => "#{options[:require_avatar] ? ' users.avatar_id IS NOT NULL' : nil}", 
      :order => 'count DESC', 
      :joins => "LEFT JOIN users ON users.id = activities.user_id",
      :limit => options[:limit]
      )
    activities.map{|a| find(a.user_id) }
  end  
end
