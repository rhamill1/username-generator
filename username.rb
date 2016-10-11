# Make sure to run the tests in your /spec folder
# Run `rspec /spec/username_spec.rb` to get started.

def format_name(first, last)
  if last != "" and first != ""
    cleanFirst = "#{first}".gsub(/[^a-z ]/i, '').delete(" ")
    cleanLast = "#{last}".gsub(/[^a-z ]/i, '').delete(" ")
    "#{cleanFirst[0]}#{cleanLast}".downcase
  else
    nil
  end
end

def format_year(year)
  if (year.to_s).length != 4
    nil
  else
    (year.to_s)[-2,2]
  end
end

def check_privilege(userPrivId=0)
  user_types = ["user", "seller", "manager", "admin"]
  if userPrivId >= 0 && userPrivId < user_types.length - 1
    user_types[userPrivId.floor]
  else
    user_types[user_types.length - 1]
  end
end

def user_type_prefix(userPrivId)
  return "" if userPrivId == 0
  check_privilege(userPrivId) + "-"
end

def build_username(first, last, year, userPrivId=0)
  user_type_prefix(userPrivId) + format_name(first, last) + format_year(year)
end

$user_counts = {}
def generate_username(first, last, year, level=0)
  username = build_username(first, last, year, level)

  if $user_counts[username].nil?
    $user_counts[username] = 0
    username
  else
    $user_counts[username] +=1
    user_count = $user_counts[username].to_s
    username + "_" + user_count
  end
end
