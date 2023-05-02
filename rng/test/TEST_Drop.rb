class Drop_Daggers
  def test
    run_test = 2
    
    if run_test == 0
      level = 6
      atk = 43
      grade = @drp_box_cutters.get_weapon_grade(level, atk)
      
      rng = RNG_Expo_Step.new
      curve = rng.pure_curve(level)
      grade2 = rng.rng_grade(level, curve)
      
      puts "Level: " + level.to_s
      puts "Atk: " + atk.to_s
      puts "Grade: " + grade
      
      puts "-------"
      puts "Pure Curve: " + curve.to_s
      puts "Pure Grade: " + grade2
    elsif run_test == 1
      @drp_box_cutters.test
      t = drop_box_cutter
      puts "drop_box_cutter.name = " + t.name
    elsif run_test == 2
      
      # INFORMATION
      # Generated Weapon Count | Notes
      # -----------------------|-----------------------------------------------
      # 1000                   | + Very slight lag in general movement and 
      #                        |   interaction 
      #                        | + Noticable lag in the player equipment or 
      #                        |   items->weapon menu
      # -----------------------|-----------------------------------------------
      # 900                    | + Very slight lag in general movement and 
      #                        |   interaction 
      #                        | + Noticable lag in the player equipment or 
      #                        |   items->weapon menu
      # -----------------------|-----------------------------------------------
      # 800                    | + No noticable lag in general movement and 
      #                        |   interaction 
      #                        | + Noticable lag in the player equipment or 
      #                        |   items->weapon menu
      # -----------------------|-----------------------------------------------
      # 200                    | + No noticable lag in general movement and 
      #                        |   interaction 
      #                        | + Very slight lag in the player equipment or 
      #                        |   items->weapon menu
      # -----------------------|-----------------------------------------------
      # 100                    | + No noticable lag in general movement and 
      #                        |   interaction 
      #                        | + No Noticable lag in the player equipment
      #                        |   menu
      #                        | + Very slight lab in the items->weapon menu
      # -----------------------|-----------------------------------------------

      for i in 1..50 do
        # This method will add it to the player inventory automatically
        drop_box_cutter
      end
    elsif run_test == 2
      boxCutter = drop_box_cutter
    
      if (false == boxCutter)
        puts "FAILED TO GET BOX CUTTER IN CLASS 'Drop_Daggers'"
      else
        puts "SUCCESSFULLY GOT BOX CUTTER IN CLASS 'Drop_Daggers'"
        puts "Dagger: " + boxCutter.name
      end  
    end
  end
end