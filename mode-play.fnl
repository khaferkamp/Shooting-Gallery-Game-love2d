(local d (require "draw"))

(var timer 0)

(var counter 0)

(local game-font (love.graphics.newFont 30))

(var target {:r 0
             :x 0
             :y 0})

(fn activate [timer-in counter-in target-in]
  (set timer timer-in)
  (set counter counter-in)
  (set target target-in))

(fn distance-between [x1 y1 x2 y2]
  (math.sqrt (+ (^ (- x2 x1) 2) (^ (- y2 y1) 2))))

(fn draw [message]
  (d.draw-background)
  (love.graphics.setColor 1 1 1)
  (love.graphics.print (: "Score: %d" "format" counter) game-font 0 0)
  (love.graphics.print (: "Timer: %d" "format" (math.ceil timer)) game-font 200 0)
  (d.draw-target target.x target.y target.r)
  (d.draw-crosshairs (love.mouse.getX) (love.mouse.getY) 20))

(fn keypressed [key set-mode])

(fn mousepressed [x y button istouch presses set-mode]
  (when (and (= button 1) (< (distance-between x y target.x target.y) target.r))
    (set counter (+ counter 1))
    (tset target "x" (math.random target.r (- (love.graphics.getWidth) target.r)))
    (tset target "y" (math.random target.r (- (love.graphics.getHeight) target.r)))))

(fn update [dt set-mode]
  (when (>= timer 0)
    (set timer (- timer dt)))
  (when (< timer 0)
    (set timer 0)
    (set-mode "mode-gameover" (string.format "Highscore %d points!" counter))))

{:activate activate
 :draw draw
 :keypressed keypressed
 :mousepressed mousepressed
 :update update}

