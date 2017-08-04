json.messages @messages.each do |message|
  json.user_name message.user.name
  json.created_at message.created_at
  json.image message.image.url
  json.body message.body
end


