-- Collision detection function;
-- Returns true if two boxes overlap, false if they don't;
-- x1,y1 are the top-left coords of the first box, while w1,h1 are its width and height;
-- x2,y2,w2 & h2 are the same, but for the second box.
function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

function BulletHitEnemy(dt)


  for LOE = #ListofEnemies,1,-1 do
    --loe means list of enemies
    local ItemLE = ListofEnemies[LOE]
    for LOB = #ListOfBullets,1, -1 do
      -- lob means listofbullets
      local ItemLB = ListOfBullets[LOB]
      -- start of bullet hitting enemy
      if CheckCollision(ItemLB.x,ItemLB.y,ItemLB.w,ItemLB.h,ItemLE.x,ItemLE.y,ItemLE.w,ItemLE.h) then
          table.remove(ListOfBullets,LOB)

          --RageMode.w = RageMode.w + RageMode.meterAdd -- Increase the Rage Modes Width / save for later

         -- RageMode.meter = RageMode.meter + RageMode.meterAdd -- Increase RageMode meter / save for later

          ItemLE.health = ItemLE.health - Bulletdamage

          if ItemLE.health < 1 then

            table.remove(ListofEnemies, LOE)

            experiencePoints.value = experiencePoints.value + ItemLE.experience

            Ammo = Ammo + AddAmmo

            --End of Bullet hitting Enemy

          end
      end
    end
  end
end



function EnemyHitPlayer(dt)
  local dt = love.timer.getDelta( )
    for LOEForPlayer = #ListofEnemies,1,-1 do
      local ItemListForPlayer = ListofEnemies[LOEForPlayer]
      if CheckCollision(ItemListForPlayer.x,ItemListForPlayer.y,ItemListForPlayer.w,ItemListForPlayer.h,player.x,player.y,player.w,player.h) then 
          player.health = player.health - ItemListForPlayer.damage * dt
        end
    end
end

--shopsystemCollision

