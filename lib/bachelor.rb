def get_first_name_of_season_winner(data, season)
  winner = ""
  
  data[season].each do |ele|
    ele.each do |key, val|
     winner = ele["name"] if ele["status"].include?("Winner")
    end
  end
  
  winner.split(" ").first
end

def get_contestant_name(data, occupation)
  data.each_value do |contestants|
    contestants.each do |ele|
      ele.each do |key, val|
       return ele["name"] if ele["occupation"] == occupation 
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  counter = 0
  data.each_value do |contestants|
    contestants.each do |ele|
      ele.each do |key, val|
        counter += 1 if val == hometown
      end
    end
  end
  
  counter
end

def get_occupation(data, hometown)
  data.each_value do |contestants|
    contestants.each do |ele|
      ele.each_value {|val| return ele["occupation"] if val == hometown}
    end
  end
end

def get_average_age_for_season(data, season)
  sum = 0
  
  data[season].each do |ele|
    sum += ele["age"].to_i    
  end
  
  average = (sum * 1.0) / data[season].length 
  
  (average + 0.5).floor
end
