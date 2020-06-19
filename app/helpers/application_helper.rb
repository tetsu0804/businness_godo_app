module ApplicationHelper
  def full_name(user)
    "#{user.last_name}#{user.first_name}さん"
  end

  def name_full(last_name, first_name)
    "#{last_name} #{first_name} さん"
  end
end
