json.array! @guests do |guest|
  next if guest.age < 40 || guest.age > 50
  json.partial! 'guest', guest: guest
end
