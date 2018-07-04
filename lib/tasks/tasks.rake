task :logout_users => :environment do
  User.where(logged: true).each do |user|
    one_hour_ago = Time.now = 1.hour
    if user.login_datetime < one_hour_ago
      user.logout
    end
  end
end