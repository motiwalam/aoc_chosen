module Day1 where
-- part 1
d = map read . words =<< readFile "./data/day1p1.txt"
sum $ map (\x -> if x then 1 else 0) $ zipWith (<) d $ drop 1 d

-- part 2
d = map read . words =<< readFile "./data/day1p1.txt"
sum $ map (\x -> if x then 1 else 0) $ zipWith (<) d $ drop 3 d