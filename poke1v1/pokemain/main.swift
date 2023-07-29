import Foundation

// Define the Pokemon class
class Pokemon {
    let name: String
    var health: Int
    let type: String
    var attacks: [String]
    var attackDamage: [Int]
    
    init(name: String, health: Int, type: String, attacks: [String], attackDamage: [Int]) {
        self.name = name
        self.health = health
        self.type = type
        self.attacks = attacks
        self.attackDamage = attackDamage
    }
    
    func attack(target: Pokemon, attackIndex: Int) {
        if health <= 0 {
            print("\(name) está Morto! \n")
            return
        }
        
        if attackIndex >= 0 && attackIndex < attacks.count && attackIndex < attackDamage.count {
            let attackName = attacks[attackIndex]
            print("\(name) attacks \(target.name) with \(attackName)! \n")
            let damage = attackDamage[attackIndex] // Valor dmg do atck
            target.health -= damage
            print("\(target.name)'s health reduced to \(target.health) \n")
        } else {
            print("Invalid attack index. \n")
        }
    }
    
    func switchPokemon(newPokemon: Pokemon) {
        print("\(name) retorna! \n")
        print("Vai, \(newPokemon.name)!")
        let tempHealth = health
        health = newPokemon.health
        newPokemon.health = tempHealth
    }
}

// Function to randomly select a Pokemon from a given list
func chooseRandomPokemon(from pokemonList: [Pokemon]) -> Pokemon {
    let randomIndex = Int.random(in: 0..<pokemonList.count)
    return pokemonList[randomIndex]
}

// Create a list of available Pokemon
let availablePokemon = [
    Pokemon(name: "meganium", health: 100, type: "Grass", attacks: ["Petal Blizzard", "Solar Beam", "Body Slam", "Petal Dance"], attackDamage: [10, 20, 30, 40]),
    Pokemon(name: "charizard", health: 100, type: "Fire", attacks: ["Flare Blitz", "Inferno", "Flamethrower", "Dragon Breath"], attackDamage: [10, 20, 30, 40]),
    Pokemon(name: "blastoise", health: 100, type: "Water", attacks: ["Flash Cannon", "Ice Beam", "Hydro Pump", "Skull Bash"], attackDamage: [10, 20, 30, 40]),
    Pokemon(name: "venusaur", health: 100, type: "Grass", attacks: ["Petal Blizzard", "Sludge Bomb", "Solar Beam", "Frenzy Plant"], attackDamage: [10, 20, 30, 40]),
    Pokemon(name: "typhlosion", health: 100, type: "Fire", attacks: ["Overheat", "Flamethrower", "Lava Plume", "Eruption"], attackDamage: [10, 20, 30, 40]),
    Pokemon(name: "feraligator", health: 100, type: "Water", attacks: ["Hydro Pump", "Super Power", "Aqua Tail", "Trash"], attackDamage: [10, 20, 30, 40]),
    Pokemon(name: "sceptile", health: 100, type: "Grass", attacks: ["Leaf Storm", "Leaf Blade", "Slam", "Giga Drain"], attackDamage: [10, 20, 30, 40]),
    Pokemon(name: "blaziken", health: 100, type: "Fire", attacks: ["Flare Blitz", "Blaze Kick", "Bounce", "Flamethrower"], attackDamage: [10, 20, 30, 40]),
    Pokemon(name: "swampert", health: 100, type: "Water", attacks: ["Sludge Wave", "Earthquake", "Surf", "Hydro Cannon"], attackDamage: [10, 20, 30, 40]),
    Pokemon(name: "torterra", health: 100, type: "Grass", attacks: ["Leaf Storm", "Giga Drain", "Crunch", "Wood Hammer"], attackDamage: [10, 20, 30, 40]),
    Pokemon(name: "infernape", health: 100, type: "Fire", attacks: ["Flare Blitz", "Acrobatics", "Flame Wheel", "Flamethrower"], attackDamage: [10, 20, 30, 40]),
    Pokemon(name: "Empoleon", health: 100, type: "Water", attacks: ["Hydro Pump", "Drill Peck", "Brine", "Bubble Beam"], attackDamage: [10, 20, 30, 40]),
    Pokemon(name: "Serperior", health: 100, type: "Grass", attacks: ["Leaf Storm", "Giga Drain", "Leaf Blade", "Slam"], attackDamage: [10, 20, 30, 40]),
    Pokemon(name: "Emboar", health: 100, type: "Fire", attacks: ["Heat Wave", "Rock Slide", "Focus Blast", "Flame Charge"], attackDamage: [10, 20, 30, 40]),
    Pokemon(name: "Samurott", health: 100, type: "Water", attacks: ["Hydro Pump", "Aqua Tail", "Razor Shell", "Mega Horn"], attackDamage: [10, 20, 30, 40]),
    Pokemon(name: "Chesnaught", health: 100, type: "Grass", attacks: ["Solar Beam", "Gyro Ball", "Energy Ball", "Superpower"], attackDamage: [10, 20, 30, 40]),
    Pokemon(name: "Delphox", health: 100, type: "Fire", attacks: ["Fire Blast", "Psychic", "Mystical Fire", "Blast Burn"], attackDamage: [10, 20, 30, 40]),
    Pokemon(name: "Greninja", health: 100, type: "Water", attacks: ["Extrasensory", "Aerial Ace", "Shadow Sneak", "Hydro Pump"], attackDamage: [10, 20, 30, 40]),
    Pokemon(name: "Decidueye", health: 100, type: "Grass", attacks: ["Brave Bird", "Leaf Blade", "Snucker Punch", "Leaf Storm"], attackDamage: [10, 20, 30, 40]),
    Pokemon(name: "Incineroar", health: 100, type: "Fire", attacks: ["Flare Blitz", "trash", "Flamethrower", "Throat Chop"], attackDamage: [10, 20, 30, 40]),
    Pokemon(name: "Primarina", health: 100, type: "Water", attacks: ["Moon Blast", "Bubble Beam", "Sparkling Aria", "Hydro Pump"], attackDamage: [10, 20, 30, 40])
]

// Function to let a player choose their team of Pokemon
func chooseTeam() -> [Pokemon] {
    var team: [Pokemon] = []
    
    print("Choose your team of 6 Pokemon:")
    for i in 1...6 {
        print("Pokemon \(i):")
        for (index, pokemon) in availablePokemon.enumerated() {
            print("\(index + 1). \(pokemon.name)")
        }
        
        if let choice = readLine(), let pokemonIndex = Int(choice) {
            if pokemonIndex > 0 && pokemonIndex <= availablePokemon.count {
                let chosenPokemon = availablePokemon[pokemonIndex - 1]
                team.append(chosenPokemon)
                print("\n")
            } else {
                print("Invalid choice. Try again. \n")
            }
        }
    }
    
    return team
}

// Function to show the menu and return the selected option
func showMenu() -> Int? {
    print("Menu:")
    print("1. Battle - Friendly")
    print("2. Battle - Ranking")
    print("3. Exit")
    print("Choose an option:")
    
    return Int(readLine() ?? "")
}

// Enum to represent the battle result
enum BattleResult {
    case playerWin
    case playerLoss
    case draw
}

// Function to simulate a battle between two teams and return the result
func battle(playerTeam: [Pokemon], computerTeam: [Pokemon]) -> BattleResult {
    var currentPlayerPokemonIndex = 0
    var currentComputerPokemonIndex = 0
    
    while currentPlayerPokemonIndex < playerTeam.count && currentComputerPokemonIndex < computerTeam.count {
        let currentPlayerPokemon = playerTeam[currentPlayerPokemonIndex]
        let currentComputerPokemon = computerTeam[currentComputerPokemonIndex]
        
        print("\(currentPlayerPokemon.name)'s turn:")
        var validAction = false
        
        while !validAction {
            print("Choose an action:")
            print("1. Attack")
            print("2. Switch to another Pokemon")
            
            if let choice = readLine(), let action = Int(choice) {
                switch action {
                case 1:
                    var validAttackChoice = false
                    
                    while !validAttackChoice {
                        print("Choose an attack:")
                        for (index, attack) in currentPlayerPokemon.attacks.enumerated() {
                            print("\(index + 1). \(attack)")
                        }
                        
                        if let attackChoice = readLine(), let attackIndex = Int(attackChoice) {
                            if attackIndex > 0 && attackIndex <= currentPlayerPokemon.attacks.count {
                                let chosenAttackIndex = attackIndex - 1
                                currentPlayerPokemon.attack(target: currentComputerPokemon, attackIndex: chosenAttackIndex)
                                validAttackChoice = true
                                print("\n")
                            } else {
                                print("Invalid attack choice. Try again.")
                            }
                        } else {
                            print("Invalid input. Try again.")
                        }
                    }
                    
                    validAction = true
                case 2:
                    print("Choose a Pokemon to switch to:")
                    for (index, pokemon) in playerTeam.enumerated() {
                        if index != currentPlayerPokemonIndex {
                            print("\(index + 1). \(pokemon.name)")
                        }
                    }
                    
                    if let switchChoice = readLine(), let switchIndex = Int(switchChoice) {
                        let chosenSwitchIndex = switchIndex - 1
                        
                        if chosenSwitchIndex >= 0 && chosenSwitchIndex < playerTeam.count && chosenSwitchIndex != currentPlayerPokemonIndex {
                            let newPokemon = playerTeam[chosenSwitchIndex]
                            currentPlayerPokemon.switchPokemon(newPokemon: newPokemon)
                            currentPlayerPokemonIndex = chosenSwitchIndex
                            validAction = true
                        } else {
                            print("Invalid choice. Try again.")
                        }
                    } else {
                        print("Invalid input. Try again.")
                    }
                default:
                    print("Invalid option. Try again.")
                }
            } else {
                print("Invalid input. Try again.")
            }
        }
        
        // Randomize computer's attack
        let computerAttackIndex = Int.random(in: 0..<currentComputerPokemon.attacks.count)
        currentComputerPokemon.attack(target: currentPlayerPokemon, attackIndex: computerAttackIndex)
        
        if currentPlayerPokemon.health <= 0 {
            print("\(currentPlayerPokemon.name) fainted!")
            currentPlayerPokemonIndex += 1
        }
        if currentComputerPokemon.health <= 0 {
            print("\(currentComputerPokemon.name) fainted!")
            currentComputerPokemonIndex += 1
        }
    }
    
    if currentPlayerPokemonIndex >= playerTeam.count {
        print("You lost the battle! \n")
        return .playerLoss
    } else if currentComputerPokemonIndex >= computerTeam.count {
        print("You won the battle! \n")
        return .playerWin
    } else {
        print("The battle ended in a draw! \n")
        return .draw
    }
}

// Function to simulate battles with ranking
func battleWithRanking(playerTeam: [Pokemon], computerTeam: [Pokemon]) {
    var playerWins = 0
    var playerLosses = 0

    // Display initial ranking
    print("Battle with Ranking")
    print("Wins: \(playerWins)")
    print("Losses: \(playerLosses)")
    print("\n")
    
    while true {
        let option = showMenu()
        
        switch option {
        case 1:
            // Friendly battle
            battle(playerTeam: playerTeam, computerTeam: computerTeam)
        case 2:
            // Battle with ranking
            let randomComputerTeam = computerTeam.shuffled()
            let playerTeamCopy = playerTeam.map { $0 } // Create a copy of player's team to preserve original order
            let result = battle(playerTeam: playerTeamCopy, computerTeam: randomComputerTeam)
            
            if result == .playerWin {
                playerWins += 1
            } else if result == .playerLoss {
                playerLosses += 1
            }
            
            // Display updated ranking
            print("Wins: \(playerWins)")
            print("Losses: \(playerLosses)")
            print("\n")
        case 3:
            // Exit the game
            print("Thank you for playing!")
            return
        default:
            print("Invalid option. Try again.")
        }
    }
}

// Start the game
print("Welcome to Pokemon 1v1!")

let option = showMenu()
if option == 1 {
    // Friendly battle
    let playerTeam = chooseTeam()
    
    // Create the computer's team (randomly chosen)
    var computerTeam: [Pokemon] = []
    for _ in 1...6 {
        let randomPokemon = chooseRandomPokemon(from: availablePokemon)
        computerTeam.append(randomPokemon)
    }
    
    battle(playerTeam: playerTeam, computerTeam: computerTeam)
} else if option == 2 {
    // Battle with ranking
    let playerTeam = chooseTeam()
    
    // Create the computer's team (randomly chosen)
    var computerTeam: [Pokemon] = []
    for _ in 1...6 {
        let randomPokemon = chooseRandomPokemon(from: availablePokemon)
        computerTeam.append(randomPokemon)
    }
    
    battleWithRanking(playerTeam: playerTeam, computerTeam: computerTeam)
} else {
    // Exit the game
    print("Thank you for playing!")
}
