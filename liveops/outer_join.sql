SELECT puzzles.name, count(solutions.puzzle_id) 
  FROM puzzles
  LEFT OUTER JOIN solutions ON puzzles.id = solutions.puzzle_id
  GROUP BY puzzles.id;
