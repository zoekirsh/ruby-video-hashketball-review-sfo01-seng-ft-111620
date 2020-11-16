# Write your code below game_hash

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def helper_hash 
  # how would i get this method to return a new hash of hashes with all the players?
  game_hash.each do |team, teamHash| 
    teamHash.each do |infoKeys, data|
      if infoKeys == :players 
        player_hash = Hash[data.map { |player| [player[:player_name], player] } ]
      end 
    end
  end
end


def num_points_scored(player_name)
    #game_hash -> :home -> :players -> [ -> { :player_name 
  game_hash.each do |team, teamHash| 
    teamHash[:players].each do |hash|
      return hash[:points] if hash[:player_name] == player_name
    end 
  end   
end 

def shoe_size(player_name)
  game_hash.each do |team, teamHash| 
    teamHash[:players].each do |hash|
      return hash[:shoe] if hash[:player_name] == player_name
    end 
  end  
end

def team_colors(team_name)
  #game_hash -> :home -> :colors 
  game_hash.each do |team, teamHash|
    return teamHash[:colors] if teamHash[:team_name] == team_name
  end
end

def team_names
  #game_hash -> :home -> :team_name 
  #collect into an array and return array of both team team_names
  both_teams = []
  game_hash.each do |team, teamHash|
    both_teams << teamHash[:team_name]
  end
  return both_teams
end

def player_numbers(team_name)
  #game_hash -> :home -> :players -> [ { :number 
  #collect all :number and store in an array, return sorted array
  all_player_numbers = []
  game_hash.each do |team, teamHash|
    if teamHash[:team_name] == team_name 
      teamHash[:players].each do |hash|
        all_player_numbers << hash[:number]
      end
    end
  end
  return all_player_numbers.sort 
end

def player_stats(player_name)
  game_hash.each do |team, teamHash|
    teamHash[:players].each do |hash|
      return hash if hash[:player_name] == player_name
    end 
  end
end

def big_shoe_rebounds
  #iterate through each team, update a shoe size counter -> hash? {name => shoe}
  #return the :rebounds of that :player_name
  big_shoe_counter = 0
  rebound_counter = 0
  game_hash.each do |team, teamHash|
    teamHash[:players].each do |hash|
      if hash[:shoe] > big_shoe_counter 
        big_shoe_counter = hash[:shoe]
        rebound_counter = hash[:rebounds]
      end
    end
  end
  return rebound_counter
end
