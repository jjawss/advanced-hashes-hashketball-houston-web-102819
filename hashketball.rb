# Write your code here!

def game_hash
  hash = {
    :home =>{ 
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {:player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        {:player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        {:player_name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        {:player_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        {:player_name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      ]
    },
      
    :away =>{
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players =>[  
        {:player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        {:player_name => "Bismack Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
        {:player_name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        {:player_name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        {:player_name => "Kemba Walker",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      ]
    }
  }
end

#######################################################################################
#Methods Tool Box
#######################################################################################
#Access ALL player data AoH 
def player_data
  players = []
  game_hash.each do |home_away, team_details|
    players << team_details[:players]
  end
  return players.flatten
end


#Access player data by team AoH
def player_data_by_team(team)
  players = []
  if team == game_hash[:home][:team_name]
    players << game_hash[:home][:players]
  else
    players << game_hash[:away][:players]
  end
  return players.flatten
end  


#######################################################################################
#
#Answers
#######################################################################################
#######################################################################################
def num_points_scored(name)
  player_data.each do |player|
    if name == player[:player_name]
      return player[:points]
    end
  end
end
##########################################
def shoe_size(name)
  i = 0
  while i < player_data.length
    if player_data[i][:player_name] == name
      return player_data[i][:shoe]
    end
    i+=1
  end
end
###########################################
def team_colors(team_name)
  if team_name == "Brooklyn Nets"
    return game_hash[:home][:colors]
  else
    return game_hash[:away][:colors]
  end 
end
###########################################
def team_names
  teams = []
  teams << game_hash[:home][:team_name]
  teams << game_hash[:away][:team_name]
  return teams
end
############################################
def player_numbers(team_name)
  team_numbers = []
  team_data = player_data_by_team(team_name)
  team_data.each do |player|
    team_numbers.push(player[:number])
  end
  return team_numbers
end
#############################################
def player_stats(player_name)
  stats = {}
  player_data.each do |player|
    if player_name == player[:player_name]
      stats[:number] = player[:number]
      stats[:shoe] = player[:shoe]
      stats[:points] = player[:points]
      stats[:rebounds] = player[:rebounds]
      stats[:assists] = player[:assists]
      stats[:steals] = player[:steals]
      stats[:blocks] = player[:blocks]
      stats[:slam_dunks] = player[:slam_dunks]
    end
  end
  return stats
end

##############################################

def big_shoe_rebounds
  biggest_shoe_player = player_data[0]
  player_data.each do |player|
    if player[:shoe] > biggest_shoe_player[:shoe]
      biggest_shoe_player = player
    end
  end
  return biggest_shoe_player[:rebounds]
end   

#p big_shoe_rebounds  
