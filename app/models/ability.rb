class Ability
  include CanCan::Ability
  
  def initialize(user)   
    if %w[leader].include? user.functionary.function
        can [:create], Address
        can [:read, :update], Address, functionary_id: user.functionary.id
        can [:read, :update], Address, functionary: {leader: user.functionary.id}
        
        can [:create], Car
        can [:read, :update], Car, functionary_id: user.functionary.id
        can [:read, :update], Car, functionary: {leader: user.functionary.id}

        can [:create], Displacement
        can [:read, :update], Displacement, functionary_id: user.functionary.id
        can [:read, :update], Displacement, functionary: {leader: user.functionary.id}

        can [:create ], Functionary
        can [:read, :update], Functionary, id: user.functionary.id
        can [:read, :update], Functionary, leader: user.functionary.id
    else
        can [:read, :create, :update], Address, functionary_id: user.functionary.id
        can [:read, :create, :update], Displacement, functionary_id: user.functionary.id
        can [:read], Car, functionary_id: user.functionary.id
        can [:read], Functionary, id: user.functionary.id
    end
  end
end