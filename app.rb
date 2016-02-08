require("sinatra")
require_relative("art")

enable :sessions

get("/") do
  session["ascii"] = random_ascii_name
  if session["score"] == nil
    session["score"] = 0
  end
  # Build my choices array
  @choices = []
  @choices.push(session["ascii"])
  while @choices.count < 5
    new_choice = random_ascii_name
    if @choices.include?(new_choice)
    else
      @choices.push(new_choice)
    end
  end
  @choices = @choices.shuffle
  # Finish building my choices array
  erb :index
end

post("/submission") do
  if params["guess"] == session["ascii"]
    @correct = true
    session["score"] += 1
  else
    @correct = false
    session["score"] -= 1
  end

  erb :submission
end
