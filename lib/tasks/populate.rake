# lib/tasks/populate.rake
namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    require 'randexp'
    
    [User].each(&:delete_all)
    
    User.populate 10 do |user|
      user.login = /\w{10}/.gen
      user.login_slug = user.login
      user.description = Populator.sentences(5..10)
      user.vendor = [true, false]
      user.email = Faker::Internet.email
      user.zip = /\d{5}/.gen
      user.activated_at = 2.years.ago..Time.now
      user.salt = "c703e67ef134f2af99815f1739ed0c7ddfe47c4c"
      user.crypted_password = "b1ccee1b61bcff94fb2db956efc4e3cc6689d8bf"
      user.updated_at                = 6.months.ago..Time.now
      # user.stylesheet
      user.view_count                = 1..103
      user.vendor                    = [true, false]
      user.state_id                  = 11
      user.metro_area_id             = 12..18
      user.notify_comments           = [true, false]          
      user.notify_friend_requests    = [true, false]
      user.notify_community_news     = [true, false]
      user.country_id                = 208
      user.featured_writer           = [true, false]
      user.last_login_at             = 2.months.ago..Time.now
      # user.birthday
      user.gender                    = ["male", "female"]
      user.profile_public            = [true, false]
      # user.activities_count         
      # user.sb_posts_count           
      # user.sb_last_seen_at
      user.role_id                   = [1, 2, 3]
      Post.populate 1..8 do |post|
        created                      = 5.months.ago..Time.now
        post.created_at              = created
        post.updated_at              = created
        post_content                 = Populator.sentences(10..50)
        post.raw_post                = post_content
        post.post                    = post_content
        post.title                   = Populator.words(1..3)
        post.category_id             = nil
        post.user_id                 = user.id
        post.view_count              = 1..30
        post.contest_id              = nil
        post.emailed_count           = 0
        post.favorited_count         = 0
        post.published_as            = ["live"]
        post.published_at            = created        
      end
    end          
  end
end