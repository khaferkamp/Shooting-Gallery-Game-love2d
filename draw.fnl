(local sprites {:crosshairs (love.graphics.newImage "assets/crosshairs.png")
                :sky (love.graphics.newImage "assets/sky.png")
                :target (love.graphics.newImage "assets/target.png")})

(fn draw-img [img x y offset]
  (let [pos-x (- x offset)
        pos-y (- y offset)]
    (love.graphics.draw img pos-x pos-y)))

(fn draw-background []
  (love.graphics.draw sprites.sky))

(fn draw-crosshairs [x y offset]
  (draw-img sprites.crosshairs x y offset))

(fn draw-target [x y offset]
  (draw-img sprites.target x y offset))

(fn new-target []
  {:r 50
   :x (math.random 50 (- (love.graphics.getWidth) 50))
   :y (math.random 50 (- (love.graphics.getHeight) 50))})

{:draw-background draw-background
 :draw-crosshairs draw-crosshairs
 :draw-target draw-target
 :new-target new-target}

