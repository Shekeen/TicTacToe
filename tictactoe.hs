module Main where

main = do
  let (newBoard, playerA, playerB) = startNewGame
  playGame newBoard playerA playerB

playGame newBoard playerA playerB = do
  makeMove newBoard Cross
  where
    makeMove board side = do
      displayBoard board
      let player = getPlayer side
      let nextBoard = player board side
      if isVictory nextBoard side
        then return ("Winner is " ++ show side)
        else makeMove nextBoard $ opponent side
        
    getPlayer Cross = playerA
    getPlayer Circle = playerB
    
    opponent Cross = Circle
    opponent Circle = Cross
    
    isVictory = undefined

startNewGame = undefined
displayBoard = undefined

data Token = Cross | Circle

data Board 