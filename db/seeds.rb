begin
  puts "well delete my meat..."

  p Animal.destroy_all
  p PrimalCut.destroy_all
  p Cut.destroy_all

  puts "let's meat up:"

  animals          = Animal.create([{name: "Cow"}, {name: "Pig"}])

  puts "how nice to meat you."

  cow_primal_cuts = %w{Chuck Short-Loin Rib}.each          { |cow_primal_cut| p animals[0].primal_cuts.find_or_create_by_name(cow_primal_cut) }
  pig_primal_cuts = %w{Jowl Ham Loin}.each                 { |pig_primal_cut| p animals[1].primal_cuts.find_or_create_by_name(pig_primal_cut) }

  puts "primal_cuts seeded"

  cow_cuts        = %w{Porterhouse T-Bone Strip}.each      { |cow_cut|        p animals[0].cuts.find_or_create_by_name(cow_cut) }
  pig_cuts        = %w{Babyback-Ribs Spare-Ribs Hock}.each { |pig_cut|        p animals[1].cuts.find_or_create_by_name(pig_cut) }

  puts "cuts seeded"

  cow_sub_cuts    = %w{Prime-Rib Ribeye}.each              { |cow_sub_cut|    p animals[0].primal_cuts.find_by_name(cow_primal_cuts[2]).cuts.find_or_create_by_name(cow_sub_cut) }
  pig_sub_cuts    = %w{Loin-Chop Blade-Roast}.each         { |pig_sub_cut|    p animals[1].primal_cuts.find_by_name(pig_primal_cuts[2]).cuts.find_or_create_by_name(pig_sub_cut) }

  puts "sub_cuts seeded"

  puts "successfully got your meat on..."

  @user = User.create({first_name: "Cutty", last_name: "McMeat", email: "meatisawesome@hotmail.com"})
  puts "seeded #{@user.first_name}"

  Favorite.create({cut: Cut.find(1), user: @user})
  puts "seeded favorite"

rescue
  puts "derp! no meat to you"
end
