module ApplicationHelper
  def full_name(user)
    "#{user.last_name}#{user.first_name}さん"
  end
end
