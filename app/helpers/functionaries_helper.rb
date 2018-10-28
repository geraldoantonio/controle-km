module FunctionariesHelper
  
  def leader_name(functionary)
    Functionary.find(functionary).name 
  end
  
end
