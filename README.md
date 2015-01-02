Makers Academy Week 3 Project: Battleships to Web
===========
    
###Briefing
   
This was the third team exercise at Makers Academy where the groups got a little smaller and were a continuation of the previous week's project.  
          
The task for the week was to link the game 'engine' to a user front-end that is hosted online. 
  
Our version of the game had to have the following capabilities:
  
+ Two players must each have their own board with dimensions of 10 x 10 squares.  
+ On the board, there must be a number of ships that can be positioned by the player.  
+ After players have positioned their ships, they must be able to shoot at their opponent's board.  
+ A player announces a position on the opponent's board on which to fire. 
+ The opposing player must report a 'HIT" or a 'MISS', based on the contents on that position. 
+ The attacking player notes the 'HIT' or 'MISS' on their own tracking grid. 
+ The opposing player notes if their own grid has sustained a 'HIT'. 
+ When all of one player's ships have been hit the game is over and the other player wins. 
   
   
###Analysis
    
Based on the briefing, our team initially identified the following classes: **"Ship"**, **"Tracking Grid"**, **"Target Grid"**, and **"Player"**.  Later, we presented the rationale for choosing those classes, how they should collaborate with each other, and the responsibilities we'd assigned to each class.  

________________________________________________________________________________________________________________________________


####Alternative Ideas
   
After each group presented their ideas - an alternative domain map was suggested that was a little more abstract but had merit as a solution to the brief. The premise of the *newer* idea is that a player's board is made up essentially or either **Water** or **Ship**. A player can hit *either*, and regardless of what the location is made of (ship or water) the location changes fundamentally and is unavailable to be hit again. Why not break up a grid into it's components (co-ordinates) and assign those values as variables to two *alternative* classes: **"Water"** and **"Fleet"**. After all, **Grid = Water + Fleet**
   
As a brief (illustration only) example:  
```Ruby

class Water
  def Initialize
    @locations = [A1, A2, A3...]  #the values in this array are water and will miss.  
  end
end

class Fleet
  def initialize
    @submarine  = [J2, J3, J4]
    @cruiser    = [G4, H4, I4]
    @destroyer  = [B7, B8] 
    @carrier    = [C4, C5, C6, C7, C8]
    @battleship = [E1, F1, G1, H1, I1, J1] 
  end
end
```
   
The above example is purely to illustrate that you *can* decompose the grid into squares and assign those squares to either **water** or **fleet**. Crucial to this idea is the assumption that a 'Player' would have assigned the Fleet's co-ordinates in a prior method (eg set_board), and the remaining co-ordinates are pushed into the **water** class as an array. 
   
+ When a player 'fires', the target co-ordinate could be searched for in an instance of **water**. If found - it could return a 'MISS' and must importantly, DELETE the value in the array. 
+ If the player's co-ordinate is not in the **water** array, it would continue to the arrays contained within **fleet**.
+ The shot's co-ordinates would be contained within ONE of the arrays in the **fleet** and return 'HIT'and delete itself from the array. 
+ If a shot co-ordinate passes through **water** and through **fleet**, the co-ordinate is already used and can return an error.
   
Why delete the values?!  
1. Because whether you hit water or a ship - that square has been used and makes it unavailable to be shot at.   
2. **It solves another capability** when an array in the fleet = 0 you can report that the ship has been sunk!

**MAJOR DISADVANTAGE** where are the objects in this solution? 

________________________________________________________________________________________________________________________________

###Lessons from the week 

####Get your feet wet early.
+ The design stage is very [the most] important, but **time spent** is not necessarily **progress made**.  
+ Better perhaps to get something basic down that is an early compromise, than to get the 'best' idea running late. 
+ Making **a** decision is more important it's initial outcome. The decision can be quickly changed if it doesnt work, whereas the time on fruitless discussion cannot be recovered. 

####Communication
+ We worked patiently with each other, no big egos, and mutual respect throughout the whole process. 
+ The were many occasions where being understood, and in turn, understanding what is being said can take a LOT of time to reconcile (equally times when you think you're on the same page, only to realize that is not the case!).   
+ Everybody was free to contribute, and each person had the chance to implement an idea at least once.  
    
+ Even when there was consensus on an idea/concept - there were often mini-misunderstandings that took time to resolve. Communication determines the speed of progress at every level, from Design right through to Testing.   
+ Difficult communication uses up time and a lot of energy!  
   
+ Sometimes frustration leads to setting yourself work autonomously. The instict is tough to fight, be MUST be fought!  
+ **Document everything** - we could have used Kanban cards earlier in the Design stage, and more often through the project. This would have alleviated the pressure on the verbal communication, and given the team more confidence with something to focus on. 

####Keep Swimming!
+ Concepts can feel overwhelming, and progress can feel slow, but the worst thing to do is stop.  
+ Our fastest, smoothest work was from ping pong pairing with well defined work. (80% of our progess made from 20% of our time).
+ Break the work into micro jobs and finish what you start. At least you have something for your efforts that might be useful later.  
+ Rabbit holes - if you're not documenting what you're doing, you're *kind-of* admitting its not necessary and you shouldn't be doing it. If you dont want to commit it to others - you already know you're off track!
+ 30 min rule - get help, dont repeat errors. 
