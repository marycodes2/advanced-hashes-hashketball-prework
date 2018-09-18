require 'pry'

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
        }, {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        }, {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        }, {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        }, {
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
        }, {
          player_name: "Bismak Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        }, {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        }, {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        }, {
          player_name: "Brendan Haywood",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def home_team_name
  game_hash[:home][:team_name]
end

def get_all_players
  team_players_array = game_hash.values.map do |team_data|
    team_data[:players]
  end

  team_players_array.flatten
end

def get_data_from_player(player_name, data)
  all_players = get_all_players

  all_players.reduce(nil) do |result, player_data|
    if(player_data[:player_name] == player_name)
      result = player_data[data]
    end

    result
  end
end

def num_points_scored(player_name)
  get_data_from_player(player_name, :points)
end

def shoe_size(player_name)
  get_data_from_player(player_name, :shoe)
end

def get_team(team_name)
  game_hash.values.find do |team_data|
    team_data[:team_name] == team_name
  end
end

def team_colors(team_name)
  team = get_team(team_name)
  team[:colors]
end

def team_names
  game_hash.map do |location, team_data|
    team_data[:team_name]
  end
end

def player_numbers(team_name)
  team = get_team(team_name)
  team[:players].map do |player_data|
    player_data[:number]
  end
end

def player_stats(player_name)
  players = get_all_players
  players.find do |player_data|
    player_data[:player_name] == player_name
  end
end

def big_shoe_rebounds
  players = get_all_players

  biggest_shoe = players.reduce do |result, player_data|
    if(!result)
      result = player_data
    end

    result
  end

  biggest_shoe[:rebounds]
end

puts team_names


###Hashketball lecture###

# def get_all_players
#   #returns array of all players
#   game_hash[:home][:players] + game_hash[:away][:players]
# end
#
# def get_player_info(player_to_find)
#   #finds matching players
#   get_all_players.find do |player|
#     player[:player_name] == player_to_find
# end
#
# def num_points_scored(player_to_find)
#   return get_player_info(player_to_find)[:shoe]
# end
#
# def shoe_size(player_to_find)
#   return get_player_info(player_to_find)(:shoe)
# end
#
# def team_colors(team_name_to_find)
#   #returns array of team colors
#   game_hash.each do |location, team_info|
#     if team_info[:team_name] == team_name_to_find
#       return team_info[:colors]
#     end
#   end
# end

def gets_all_players
  array_of_player_hashes = []
  game_hash.each do |location, team|
    team[:players].each do |player|
      array_of_player_hashes << player
    end
  end
  array_of_player_hashes
end

def most_points_scored
points_array = []
 # game_hash.each do |location, team|
   # team[:players].each do |player|
   #     players << player
   #   end
   # end
player_with_max_points = gets_all_players.max_by{|player| player[:points]}

   return player_with_max_points[:player_name]
 end

def winning_team
  home_team_sum = 0
  away_team_sum = 0
  game_hash.each do |location, team|
    if location == :home
      home_team_points_array = team[:players].map do |player|
        player[:points]
      end
      home_team_sum = home_team_points_array.inject(:+)
    else
      away_team_points_array = team[:players].map do |player|
        player[:points]
      end
      away_team_sum = away_team_points_array.inject(:+)
    end
  end
  if home_team_sum > away_team_sum
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
players = []
 game_hash.each do |location, team|
   team[:players].each do |player|
       players << player[:player_name]
     end
  end
   return player_longest_name = players.max_by{|player| player.size}
 end

def long_name_steals_a_ton?
  #returns true if player with longest names has the most steals
  hash_of_player_with_max_steals = gets_all_players.max_by{|player| player[:steals]}
  return player_with_longest_name == hash_of_player_with_max_steals[:player_name]
end
